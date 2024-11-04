{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
        ];
        serif = [
          "Noto Serif CJK SC"
        ];
      };
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      source-han-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      dejavu_fonts
      wqy_zenhei
      wqy_microhei
      nerdfonts
    ];
  };
}
