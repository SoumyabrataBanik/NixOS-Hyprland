{ ... }:

{
  imports = [
    ./config.nix
    ./environment.nix
    ./fonts.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./neovim.nix
    ./open-webui.nix
    ./programs.nix
    # ./rclone.nix
    ./services.nix
    ./sillytavern.nix
    # ./sops-nix.nix
    ./tmux.nix
    ./zsh.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
}
