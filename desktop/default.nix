{ config, inputs, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./inputmethod.nix
  ];

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    xserver.videoDrivers = [ "nvidia" ];

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
  ];

  hardware = {
    pulseaudio.enable = false;
    graphics.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
