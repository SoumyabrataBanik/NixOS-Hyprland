{ pkgs-unstable, ... }:

{
  gtk = {
    cursorTheme = {
      name = "Bibata-Original-Classic";
      package = pkgs-unstable.bibata-cursors;
    };
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      cursor-theme = "Bibata-Original-Classic";
    };
  };

  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,24"
      "XCURSOR_THEME,Bibata-Original-Classic"
      "HYPRCURSOR_SIZE,24"
      "HYPRCURSOR_THEME,Bibata-Original-Classic"
    ];
  };
}
