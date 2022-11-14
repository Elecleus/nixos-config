{ config, pkgs,lib , ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    grub = {
      enable = true;
      version = 2;
      device = "/dev/sdb";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
    efi.efiSysMountPoint = "/boot/efi";
  };

  networking = {
    hostName = "wanderer";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  users.users.elecleus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };

  services = {
    #xserver = {
    #  enable = true;
    #  displayManager.lightdm.enable = false;
    #  windowManager.qtile.enable = true;
    #};

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  sound.enable = true;

  environment.systemPackages = with pkgs; [
    waybar swaybg foot neofetch
    tree
    chromium qv2ray 
  ];

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;
    };
  };

  system.stateVersion = "unstable";
  nix.settings = {
    substituters = [
      #"https://mirrors.bfsu.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.nju.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Noto Sans Mono CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Source Serif CJK SC" ];
      };
    };
    fontDir.enable = true;
    #enableGhostscriptFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}
