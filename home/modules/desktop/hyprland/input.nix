{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 1;
      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
      };
      numlock_by_default = true;
      accel_profile = "adaptive";
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = 0;
    };

    cursor = {
      no_hardware_cursors = true;
    };
  };
}
