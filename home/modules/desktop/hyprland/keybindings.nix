{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$secMod" = "ALT_L";
    "$tMod" = "SHIFT_L";
    "$terminal" = "ghostty";
    "$secTerminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "rofi";
    "$browser" = "zen";
    "$secBrowser" = "firefox";

    binde = [
      # Lower or Raise sound by 1
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"

      # Lower or Raise sound by 5
      "Shift_L, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      "Shift_L, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      # Lower or Raise Brightness by 1
      ", XF86MonBrightnessUp, exec, brightnessctl set +1%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 1%-"

      # Lower or Raise Brightness by 5
      "SHIFT_L, XF86MonBrightnessUp, exec, brightnessctl set +5%"
      "SHIFT_L, XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      # Resize Window with keyboard only
      "$mainMod SHIFT, H, resizeactive, -10 0"
      "$mainMod SHIFT, L, resizeactive, 10 0"
      "$mainMod SHIFT, J, resizeactive, 0 -10"
      "$mainMod SHIFT, K, resizeactive, 0 10"
    ];

    bind = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "$mainMod, Return, exec, $terminal" # Open Primary Terminal
      "$mainMod SHIFT, Return, exec, $secTerminal" # Open Secondary Terminal
      "$mainMod SHIFT, Q, killactive," # Close current window
      "$mainMod, E, exec, $fileManager" # Open file manager
      "$mainMod, V, togglefloating," # Toggle floating window
      "$mainMod, R, exec, $menu -show drun" # Open Rofi
      "$mainMod SHIFT, J, togglesplit" # Dwindle; No idea what it does
      "$mainMod SHIFT, F, fullscreen" # Fullscreen mode

      "$mainMod, B, exec, waybar-toggle" # Toggle wayland
      "$mainMod SHIFT, B, exec, waybar-reload" # Reload wayland

      # Lock screen, reboot, poweroff
      "$mainMod, M, exec, wlogout" # Call wlogout menu
      "$mainMod SHIFT, E, exit" # Exit hyprland
      ", XF86PowerOff, exec, lock-screen" # Lock Screen
      "SHIFT, XF86PowerOff, exec, screen-suspend" # Suspend and lock screen
      "$mainMod SHIFT, P, exec, poweroff" # Poweroff
      "$mainMod SHIFT, R, exec, systemctl reboot" # Restart

      # Toggle Group
      "$mainMod, W, togglegroup"
      "$secMod SHIFT, H, changegroupactive, b"
      "$secMod SHIFT, L, changegroupactive, f"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Move focus with vim keybindings
      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move Active wondow to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + Scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Open installed applications
      "$mainMod, Z, exec, $browser"
      "$mainMod SHIFT, Z, exec, $browser --private-window"
      "$mainMod, F, exec, $secBrowser"

      # Screenshot
      ", Print, exec, hyprshot -zm region --clipboard-only"
      "SHIFT, Print, exec, hyprshot -zm region"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
