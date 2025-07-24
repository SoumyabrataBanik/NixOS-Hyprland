{ pkgs, ... }:

{
  imports = [
    ./nix-update.nix
    ./reload-waybar.nix
    ./screenlocking.nix
    ./toggle-waybar.nix
  ];
}
