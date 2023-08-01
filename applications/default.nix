{ lib, config, pkgs, ... }:

{
  imports = [
    ./programming
  ];

  environment.systemPackages = with pkgs; [
    neofetch
    tree
    openssh
    chromium
    microsoft-edge
    electron
    qv2ray
    ddnet
    ntfs3g
    vscode
    libreoffice
    musescore
    vlc
    steam
    nixpkgs-fmt
    rustup
    gcc
    #foot
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
    
    kdeconnect.enable = config.services.xserver.desktopManager.plasma5.enable;
  };
}
