{
  config,
  default-username,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.elecleus.base;
in
{
  options.elecleus.base = {
    enable = lib.mkOption {
      description = "Whether enabling my basic configuration.";
      default = false;
    };
    default-user.enable = lib.mkOption {
      description = "Whether adding default user.";
      default = true;
    };
    dae.enable = lib.mkOption {
      description = "Whether enabling dae.";
      default = true;
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        environment.systemPackages = with pkgs; [
          bat
          btop
          fastfetch
          helix
          tree
        ];

        programs = {
          git.enable = true;
          nh = {
            enable = true;
            flake = "/home/${default-username}/nixos-config";
            clean = {
              enable = true;
              extraArgs = "--keep-since 2w --keep 10";
            };
          };
        };

        services.openssh = {
          enable = true;
          ports = [ 22 ];
          settings = {
            PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
          };
        };

        boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
        hardware.enableRedistributableFirmware = true;

        time.timeZone = "Asia/Shanghai";

        system.stateVersion = "25.05";

        networking.networkmanager.enable = true;

        nix = {
          # registry.nixpkgs.flake = inputs.nixpkgs;
          channel.enable = false;
          settings = {
            substituters = [
              "https://mirrors.bfsu.edu.cn/nix-channels/store"
              "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
              "https://mirrors.nju.edu.cn/nix-channels/store"
            ];
            experimental-features = [
              "flakes"
              "nix-command"
            ];
          };
        };
      }
      (lib.mkIf cfg.default-user.enable {
        users.users."${default-username}" = {
          uid = 1000;
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "dialout"
            (lib.mkIf config.virtualisation.docker.enable "docker")
          ];
          shell = pkgs.fish;
        };
        programs.fish.enable = true;
      })
      (lib.mkIf cfg.dae.enable {
        services.daed = {
          enable = true;
          openFirewall = {
            enable = true;
            port = 12345;
          };
        };
      })
    ]
  );
}
