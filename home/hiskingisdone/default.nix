{ inputs, ... }:

{
  imports = [
    ./config.nix
    ./environment.nix
    ./fonts.nix
    ./git.nix
    ./gtk.nix
    ./neovim.nix
    ./open-webui.nix
    ./programs.nix
    ./rclone.nix
    ./services.nix
    ./sops-nix.nix
    ./zsh.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
}
