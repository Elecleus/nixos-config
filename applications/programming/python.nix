{ pkgs, ... }:
let
  my-python-packages = p: with p; [
    requests
    blessed
    autopep8
    pip
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
