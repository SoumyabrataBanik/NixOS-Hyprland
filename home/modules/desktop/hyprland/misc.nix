{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      disable_splash_rendering = true;
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
      vfr = true;
      vrr = 0;
      exit_window_retains_fullscreen = true;
    };
  };
}
