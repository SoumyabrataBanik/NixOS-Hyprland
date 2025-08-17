{ pkgs, pkgs-unstable, ... }:

{

  gtk = {

    enable = true;

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
    };
  };
}
