{ ... }:

{
  programs = {
    fish.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  home.stateVersion = "24.11";
}
