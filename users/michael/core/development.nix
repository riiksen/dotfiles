{ lib, pkgs, ... }:
{
  home = {
    file = {
      ".spacemacs" = {
        source = lib.utils.fromRoot "configs/.spacemacs";
      };
    };

    packages = with pkgs; [
      # Git
      delta
      lazygit

      # Utilities
      tokei
    ];
  };

  programs = {
    git = {
      enable = true;

      extraConfig = {
        core.pager = "delta";
        init.defaultBranch = "master";

        commit.gpgsign = true;
        tag.gpgsign = true;
        };
      };
    };

    # Code editors
    emacs.enable = true;
    vim = {
      enable = true;
    };

    neovim.enable = true;
    vscode.enable = true;

    # Utilities
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
