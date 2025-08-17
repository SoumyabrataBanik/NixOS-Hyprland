{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./modules
    inputs.sops-nix.homeManagerModules.sops
    ./scripts
    ./theme.nix
  ];

  home.username = "hiskingisdone";
  home.homeDirectory = "/home/hiskingisdone";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

}
