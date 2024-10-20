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

      desktopManager.budgie.enable = true;
      displayManager.lightdm.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  hardware = {
    pulseaudio.enable = false;
    opengl.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.nvidia_x11;
    };
  };
}
