{ pkgs, ... }:

{
    imports = [
        ./reload-waybar.nix
        ./toggle-waybar.nix
    ];
}
