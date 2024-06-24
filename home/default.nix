{ inputs, pkgs, ... }:

{
  imports = [
    ./hyprland
    ./anyrun.nix
  ];

  home.stateVersion = "23.11";
}
