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
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

  };
}
