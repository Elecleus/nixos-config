{
  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      data-root = "/home/elecleus/Programs/docker-data";
      userland-proxy = false;
      experimental = true;
      ipv6 = true;
    };

  };
}
