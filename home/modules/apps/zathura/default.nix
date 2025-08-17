{ config, pkgs-unstable, ... }:
let
  palette = config.theme.palette;
in
{
  programs.zathura = {
    enable = true;
    package = pkgs-unstable.zathura;
    mappings = {
      k = "scroll up";
      j = "scroll down";
      "<C-f>" = "toggle_fullscreen";
      "<C-q>" = "quit";
    };
    options = {
      selection-clipboard = "clipboard";
      recolor = true;

      font = "MonaspiceXe Nerd Font 12";
      default-bg = "#${palette.background}";
      default-fg = "#${palette.foreground}";

      # Status bar colors
      statusbar-fg = "#${palette.foreground}";
      statusbar-bg = "#${palette.color8}"; # A nice mid-tone gray

      # Highlight colors
      highlight-color = "#${palette.color3}"; # Your theme's yellow
      highlight-active-color = "#${palette.color1}"; # Your theme's red

      # Index colors
      index-fg = "#${palette.foreground}";
      index-bg = "#${palette.background}";
      index-active-fg = "#${palette.color4}"; # Your theme's blue
      index-active-bg = "#${palette.color8}";
    };
  };
}
