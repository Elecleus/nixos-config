{
  lib,
  mylib,
  ...
}:
{
  options.elecleus.developing = {
    enable = lib.mkOption {
      description = "Whether enabling developing tool sets.";
      default = false;
    };
    sets = lib.mkOption {
      description = "Choose developing tool sets to be enabled.";
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  imports = mylib.scanPaths ./sets;
}
