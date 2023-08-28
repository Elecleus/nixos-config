{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          #"WenQuanYi Micro Hei Mono"
          #"Sarasa Han Mono SC"
          "Source Sans Mono CJK SC"
        ];
        sansSerif = [
          #"WenQuanYi Micro Hei"
          #"Sarasa Han Sans SC"
          "Source Sans CJK SC"
        ];
        serif = [
          #"WenQuanYi Micro Hei"
          #"Sarasa Han Serif SC"
          "Source Serif CJK SC"
        ];
      };
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      source-han-mono
      source-han-sans
      source-han-serif
      noto-fonts-emoji
      #liberation_ttf
      dejavu_fonts
      wqy_zenhei
      wqy_microhei
      #sarasa-gothic
    ];
  };
}
