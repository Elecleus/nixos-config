{ config, pkgs, ... }:

{
  wsl.defaultUser = "elecleus";

  users.users.elecleus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };

  environment.systemPackages = with pkgs; [
    neofetch
    tree
    #firefox
    #electron
    #qv2ray
    # vlc
    # steam
    # nixpkgs-fmt
    # rustup
    # gcc
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
  };
}
