{ config, pkgs, ... }:

{
  networking = {
    hostName = "wanderer";
    networkmanager.enable = true;
  };

  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains-ng;
    proxies = {
      qv2ray = {
        type = "http";
        port = 8889;
        host = "127.0.0.1";
        enable = true;
      };
    };
  };

  services = {
    v2raya.enable = true;
    #xray.enable = true;
  };
}
