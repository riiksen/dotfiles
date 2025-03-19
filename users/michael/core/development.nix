{
  programs = {
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
