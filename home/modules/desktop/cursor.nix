{ pkgs-unstable, ... }:

{
  gtk = {
    cursorTheme = {
      name = "Vimix-white-cursors";
      package = pkgs-unstable.vimix-cursors;
    };
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      cursor-theme = "Vimix-white-cursors";
    };
  };

  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,23"
      "XCURSOR_THEME,Vimix-white-cursors"
      "HYPRCURSOR_SIZE,23"
      "HYPRCURSOR_THEME,Vimix-white-cursors"
    ];
  };
}
