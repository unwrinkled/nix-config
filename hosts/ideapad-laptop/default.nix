{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./cpu
    ./graphics
  ];
}
