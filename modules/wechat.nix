{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wechat-uos
  ];
}
