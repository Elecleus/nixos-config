{ config, ... }:

{
  networking = {
    hostName = "wanderer";
    networkmanager.enable = true;
  };
}
