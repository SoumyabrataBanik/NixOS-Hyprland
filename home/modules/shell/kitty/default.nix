{ pkgs-unstable, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs-unstable.kitty;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Dracula";
    font = {
      size = 12;
      name = "MonaspiceXe Nerd Font Mono";
    };
  };
}
