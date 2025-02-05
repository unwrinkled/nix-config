{
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # enable Xbox One wireless controller
  hardware.xpadneo.enable = true;
}
