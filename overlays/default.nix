{
  nixpkgs.overlays = [
    (
      final: prev: {
        cosmic-wallpapers = prev.cosmic-wallpapers.overrideAttrs {
          # src = fetchTarball {
          #   url = ./cosmic-wallpapers-master.tar;
          #   sha256 = "";
          # };
          src = ./cosmic-wallpapers-master.tar;
        };
      }
    )
  ];
}