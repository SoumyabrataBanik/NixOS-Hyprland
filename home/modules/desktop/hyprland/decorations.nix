{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 2;
      active_opacity = 0.75;
      inactive_opacity = 0.4;

      shadow = {
        enabled = false;
        range = 10;
        render_power = 6;
      };

      blur = {
        enabled = true;
        size = 7;
        passes = 2;
        vibrancy = 0.1696;
      };
    };
  };
}
