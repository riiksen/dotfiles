{ config, pkgs, inputs, ... }:

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

      configFile.source = ./config.nu;
      envFile.source = ./env.nu;
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    git = {
      enable = true;
      core.pager = "delta";

      init.defaultBranch = "master";
    };
  };

  home.packages = with pkgs; [
    neofetch
    nnn # terminal file manager
    bat

    delta

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

    lazygit

    dina-font
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
  ];

  home.file = {
    ".spacemacs" = {
      source = configs/.spacemacs;
    };
  };
}
