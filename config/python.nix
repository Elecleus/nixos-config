{ pkgs, ... }:
let
  my-python-packages = p: with p; [
    requests
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
