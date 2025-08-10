{
  nixpkgs.config.allowUnfree = true;
  
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "elecleus" ];
}
