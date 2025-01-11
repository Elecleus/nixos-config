{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./fonts.nix
    ./inputmethod.nix

  ];

  environment = {
    systemPackages = with pkgs; [

      (vscode.override {
        commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform-hint=auto"
          "--enable-wayland-ime"
        ];
      })

      vlc
      xournalpp
      rnote

      inputs.zen-browser.packages."${system}".default
    ];
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };

  hardware = {
    pulseaudio.enable = false;
    graphics.enable = true;
    bluetooth.enable = true;
  };
}
