{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    qq
  ];

  nixpkgs.config.allowUnfree = true;
}
