{ config, inputs, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./inputmethod.nix
  ];

  #hyprland = {
  #  enable = true;
  #  nvidiaPatches = true;
  #};

  services = {
    xserver = {
      enable = true;
      #displayManager.sddm.enable = true;
      #desktopManager.plasma5.enable = true;
      #desktopManager.budgie.enable = true;
      displayManager.lightdm.enable = false;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  sound.enable = true;

  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

  };
}
