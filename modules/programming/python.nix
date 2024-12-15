{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    conda
    python3Packages.python-lsp-server
  ];
}
