{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    typst
    typst-lsp
  ];
}
