{ config, pkgs,lib , ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./python.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sdb";
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
      efi.efiSysMountPoint = "/boot/efi";
    };
  };

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
    extraGroups = [ "wheel" ];
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

  hardware.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    neofetch tree
    openssh 
    chromium 
    ddnet
    ntfs3g
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
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.nju.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
	  #"WenQuanYi Micro Hei Mono"
	  "Sarasa Han Mono SC"
	  "Source Sans Mono CJK SC"
	];
        sansSerif = [
	  #"WenQuanYi Micro Hei"
	  "Sarasa Han Sans SC"
	  "Source Sans CJK SC"
	];
        serif = [
	  #"WenQuanYi Micro Hei"
	  "Sarasa Han Serif SC"
	  "Source Serif CJK SC"
	];
      };
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      source-han-mono
      source-han-sans
      source-han-serif
      noto-fonts-emoji
      liberation_ttf
      dejavu_fonts
      wqy_zenhei
      wqy_microhei
      sarasa-gothic
    ];
  };
}
