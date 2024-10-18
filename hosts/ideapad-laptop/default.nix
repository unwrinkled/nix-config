{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./cpu
    ./graphics
  ];

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
