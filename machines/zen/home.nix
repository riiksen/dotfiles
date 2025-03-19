{ config, lib, pkgs, inputs, ... }:

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "michael";
  home.homeDirectory = "/home/michael";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of a state version
  # changes in each release.
  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;

      pinentryPackage = pkgs.pinentry-qt;
    };
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    plasma = {
      enable = true;

      kwin = {
        virtualDesktops = {
          number = 15;
          rows = 3;
        };
      };
    };

    alacritty.enable = true;

    nushell = {
      enable = true;

      configFile.source = lib.shared.root "./config.nu";
      envFile.source = lib.shared.root "./env.nu";
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    # Code editors
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    vim = {
      enable = true;
    };

    neovim = {
      enable = true;
    };

    vscode = {
      enable = true;
    };

    git = {
      enable = true;
      extraConfig = {
        core.pager = "delta";
        init.defaultBranch = "master";

        commit.gpgsign = true;
        tag.gpgsign = true;
      };
    };

    gpg.enable = true;

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };

  home.packages = with pkgs; [
    home-manager

    # Core packages
    pinentry

    # KDE
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    kdePackages.krohnkite

    # Programs
    warp-terminal

    # Terminal utilities
    neofetch
    bat

    fzf
    file
    which
    tree
    gnupg
    btop
    iotop
    iftop

    strace
    ltrace
    lsof

    zip
    unzip
    rar

    sysstat
    lm_sensors
    ethtool
    dnsutils
    mtr
    nmap

    # Git
    delta
    lazygit

    # Fonts
    dina-font
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  home.file = {
    ".spacemacs" = {
      source = lib.shared.root "configs/.spacemacs";
    };
  };
}
