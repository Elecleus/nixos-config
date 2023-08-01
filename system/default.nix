{
  imports = [
    ./users
    ./boot.nix
    ./hardware-configuration.nix
    ./network.nix
  ];

  time.timeZone = "Asia/Shanghai";

  system.stateVersion = "unstable";

  nix.settings = {
    substituters = [
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      #"https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.nju.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
