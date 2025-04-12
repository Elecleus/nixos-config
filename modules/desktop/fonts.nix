{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Maple Mono NF CN"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Maple Mono NF CN"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Maple Mono NF CN"
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
      maple-mono.NF-CN
    ];
  };
}
