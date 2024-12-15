{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Maple Mono SC NF"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Maple Mono SC NF"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Maple Mono SC NF"
        ];
      };
    };
    # fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      # nerdfonts
      maple-mono-SC-NF
    ];
  };
}
