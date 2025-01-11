{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    manim
  ];
}
