{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./python.nix
      ./fonts.nix
      ./boot.nix
    ];

  networking = {
    hostName = "wanderer";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Shanghai";

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
      ];
    };
  };

  users.users.elecleus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };

  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  sound.enable = true;

  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

  };

  environment.systemPackages = with pkgs; [
    neofetch
    tree
    openssh
    chromium
    qv2ray
    ddnet
    ntfs3g
    vscode
    libreoffice
    musescore
    steam
    nixpkgs-fmt rustup gcc
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    kdeconnect.enable = true;
  };

  system.stateVersion = "unstable";
  nix.settings = {
    substituters = [
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      #"https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.nju.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
