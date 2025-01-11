{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  programs.kdeconnect.enable = true;
}
