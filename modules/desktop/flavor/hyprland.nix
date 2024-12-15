{
  inputs,
  pkgs,
  ...
}:

{
  programs = {
    hyprland = {
      enable = true;

      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    # waybar.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    helvum
    brightnessctl
    hyprsunset
    # hyprcursor
    hyprpaper
    waybar

    rose-pine-cursor
    # catppuccin-cursors.macchiatoDark
  ];

  services = {
    power-profiles-daemon.enable = true;
  };
}