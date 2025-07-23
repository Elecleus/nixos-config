{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_macchiato_transparent";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }];
      themes = {
        catppuccin_macchiato_transparent = {
          "inherits" = "catppuccin_macchiato";
          "ui.background" = { };
        };
      };
    };
  };

  xdg.configFile = { "xournalpp/toolbar.ini".source = ./toolbar.ini; };

  home.stateVersion = "24.11";
}
