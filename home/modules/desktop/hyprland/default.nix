{ pkgs-unstable, ... }:

{
  imports = [
    ./animations.nix
    ./decorations.nix
    ./envvariables.nix
    ./execs.nix
    ./general.nix
    ./gestures.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./keybindings.nix
    ./layerrules.nix
    ./misc.nix
    ./monitors.nix
    ./services.nix
    ./theme.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
  };
}
