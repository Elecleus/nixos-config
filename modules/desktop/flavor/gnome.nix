{ ... }:
{
  services.xserver = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  i18n.inputMethod.fcitx5.waylandFrontend = true;
}
