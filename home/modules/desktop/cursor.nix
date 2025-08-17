{ pkgs-unstable, ... }:

{
  gtk = {
    cursorTheme = {
      name = "Simp1e-Mix-Light";
      package = pkgs-unstable.simp1e-cursors;
    };
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      cursor-theme = "Simp1e-Mix-Light";
    };
  };

  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,23"
      "XCURSOR_THEME,Simp1e-Mix-Light"
      "HYPRCURSOR_SIZE,23"
      "HYPRCURSOR_THEME,Simp1e-Mix-Light"
    ];
  };
}
