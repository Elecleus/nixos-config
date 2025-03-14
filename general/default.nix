{
  pkgs,
  lib,
  inputs,
  username,
  ...
}:
{
  imports = [
    ./nh.nix
  ];

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  environment = {
    systemPackages = with pkgs; [
      fastfetch
      tree
      helix
    ];

    # shellAliases = {
    #   edge-wayland = "microsoft-edge --ozone-platform=wayland --enable-wayland-ime";
    #   edge-wayland-full-ime = "GTK_IM_MODULE=fcitx XMODIFIERS=@im=fcitx SDL_IM_MODULE=fcitx edge-wayland --gtk-version=4";
    # };
  };

  programs.git.enable = true;

  time.timeZone = "Asia/Shanghai";

  system.stateVersion = "24.11";

  networking.networkmanager.enable = true;

  # programs.proxychains = {
  #   enable = true;
  #   package = pkgs.proxychains-ng;
  #   proxies = {
  #     qv2ray = {
  #       type = "http";
  #       port = 8889;
  #       host = "127.0.0.1";
  #       enable = true;
  #     };
  #   };
  # };

  services = {
    daed = {
      enable = true;
      openFirewall = {
        enable = true;
        port = 12345;
      };
    };
  };

  users.users."${username}" = {
    uid = 1000;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };

  nix = {
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      substituters = [
        "https://mirrors.bfsu.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirrors.nju.edu.cn/nix-channels/store"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
