{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty
    ./helix
  ];

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "sapphire";
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Georgios Tsoulis";
    userEmail = "geotsoulis@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship.enable = true;

  programs.bash = {
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

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # bottles
    bottles

    # steam
    mangohud
    protonup

    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

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

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

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

    # gnome extensions
    gnomeExtensions.battery-health-charging
  ];
}
