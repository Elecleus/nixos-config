{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    typst
    tinymist
  ];
}
