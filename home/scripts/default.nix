{ pkgs, ... }:

{
    imports = [
        ./reload-waybar.nix
        ./toggle-waybar.nix
        ./open-webui.nix
    ];
}
