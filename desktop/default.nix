{
  config,
  ...
}:

{
  imports = [
    ./fonts.nix
    ./inputmethod.nix
    ./hyprland.nix
  ];

  services = {
    # displayManager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    # };
    # desktopManager.plasma6.enable = true;

    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;

    xserver = {
      videoDrivers = [
        "nvidia"
        "amdgpu"
      ];
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };

  environment.sessionVariables = {
    COSMIC_DISABLE_DIRECT_SCANOUT = "1";
    ELECTRON_OZONE_PLATFORM_HINT="auto";
  };

  hardware = {
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
