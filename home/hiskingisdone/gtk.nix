{ pkgs, pkgs-unstable, ... }:

{

  gtk = {

    enable = true;

    cursorTheme = {
      name = "Simp1e-Mix-Light";
      package = pkgs-unstable.simp1e-cursors;
    };

    theme = {
      name = "Dracula";
      package = pkgs-unstable.dracula-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs-unstable.papirus-folders;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Dracula";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Simp1e-Mix-Light";
    };
  };
}
