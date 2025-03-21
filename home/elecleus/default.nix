{ ... }:

{
  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
  home.stateVersion = "24.11";
}
