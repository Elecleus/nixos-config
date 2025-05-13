{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_macchiato_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
    themes = {
      catppuccin_macchiato_transparent = {
        "inherits" = "catppuccin_macchiato";
        "ui.background" = { };
      };
    };
  };

  home.stateVersion = "24.11";
}
