{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "noblur,class:^()$,title:^()$"
      "opacity 0.8 override 0.6 override 0.9 override,class:^(kitty)$"
      "opacity 1 override 1 override 1 override,class:^(zen)$"
      "opacity 1 override 1 override 1 override,class:^(brave-browser)$"
    ];
  };
}
