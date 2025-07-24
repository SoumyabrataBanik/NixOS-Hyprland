{ config, pkgs, ... }:

{
  documentation.nixos.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      auto-optimise-store = true;
    };
  };

  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 5";
    };
  };
}
