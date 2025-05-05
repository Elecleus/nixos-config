{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wechat-uos
  ];

  nixpkgs.config.allowUnfree = true;
}
