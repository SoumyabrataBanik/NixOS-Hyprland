{ pkgs, ... }:

{

  gtk = {

    enable = true;

    cursorTheme = {
      name = "Vimix Cursors - White";
      package = pkgs.vimix-cursors;
    };

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };

  };
}
