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

  hardware.enableAllFirmware = true;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
