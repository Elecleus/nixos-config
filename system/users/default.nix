{ config, ... }:

{
  users.users.elecleus = {
    uid = 1000;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };
}
