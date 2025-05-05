{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./helix.nix
  ];

  catppuccin = {
    enable = true;
    cursors = {
      enable = true;
      flavor = "macchiato";
      accent = "sapphire";
    };
    gtk = {
      enable = true;
      flavor = "macchiato";
      accent = "sapphire";
    };
    flavor = "macchiato";
    accent = "sapphire";
  };

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 4d --nogcroots";
    };
    bottom.enable = true;

    ripgrep.enable = true;
    fzf.enable = true;
    fd.enable = true;
    eza.enable = true;

    starship.enable = true;
    zoxide.enable = true;
    bat.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

        eval "$(starship init bash)"
      '';

      # set some aliases, feel free to add more or remove some
      shellAliases = {
        ll = "ls -lA";
      };
    };

    git = {
      enable = true;
      userName = "unwrinkled";
      userEmail = "geotsoulis@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
      aliases = {
        l = "log --oneline";
        d = "diff";
      };
      lfs.enable = true;
      delta.enable = true;
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # game dev
    unityhub
    jetbrains.rider

    # bottles
    bottles

    # steam
    mangohud
    protonup

    # social
    discord

    # archives
    zip
    xz
    unzip
    p7zip

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses
    lshw # show hardware details

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    neofetch
    just

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    libreoffice-qt6-fresh
    obsidian

    # system monitoring
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    powertop

    # nix tools
    nix-output-monitor
    alejandra
    nixd

    # gnome
    dconf-editor
    gnomeExtensions.battery-health-charging
  ];
}
