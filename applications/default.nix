{
  inputs,
  config,
  pkgs,
  ...
}:

{
  # nixpkgs.overlays = [
  #   inputs.niri.overlays.niri
  # ];

  imports = [
    ./programming
    ./steam.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      fastfetch
      tree
      kitty
      helix
      microsoft-edge
      vscode
      vlc
      xournalpp
      rustup
      qq

      inputs.zen-browser.packages."${system}".specific
    ];
    shellAliases = {
      edge-wayland = "microsoft-edge --ozone-platform=wayland --enable-wayland-ime";
      edge-wayland-full-ime = "GTK_IM_MODULE=fcitx XMODIFIERS=@im=fcitx SDL_IM_MODULE=fcitx edge-wayland --gtk-version=4";
    };
  };
  nixpkgs.config.allowUnfree = true;

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    ssh.forwardX11 = true;
    kdeconnect.enable = config.services.desktopManager.plasma6.enable;
  };
}
