{
  username,
  ...
}:
# let
#   username = (import ./. args).username;
# in
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep-since 2w --keep 10";
    };
  };
}
