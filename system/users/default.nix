{ config, ... }:

{
  users.users.elecleus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };
}
