{ lib, config, pkgs, inputs, ... }:

{
  # nixpkgs.overlays = [
  #   inputs.niri.overlays.niri
  # ];

  imports = [
    ./programming
  ];

  environment.systemPackages = with pkgs; [
    neofetch
    tree
    helix
    # waybar
    # openssh
    # chromium
    microsoft-edge
    #firefox
    #electron
    #qv2ray
    # ddnet
    # ntfs3g
    vscode
    # libreoffice
    # musescore
    vlc
    # steam
    nixpkgs-fmt
    rustup
    gcc
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
    # waybar.enable = true;
    kdeconnect.enable = config.services.desktopManager.plasma6.enable;
  };
}
