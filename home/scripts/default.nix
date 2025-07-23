{ pkgs, ... }:

{
  imports = [
    ./nix-update.nix
    ./reload-waybar.nix
    ./screenlock.nix
    ./toggle-waybar.nix
  ];
}
