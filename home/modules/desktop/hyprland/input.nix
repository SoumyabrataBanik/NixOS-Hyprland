{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 1;
      touchpad = {
        natural_scroll = true;
      };
      numlock_by_default = true;
      accel_profile = "adaptive";
    };

    gestures = {
      workspace_swipe = true;
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
