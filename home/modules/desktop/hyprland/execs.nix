{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      #"~/.config/hypr/scripts/screensharing.sh"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # for XDPH
      "dbus-update-activation-environment --systemd --all" # for XDPH
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # for XDPH
      #"waybar" # launch waybar
      #"blueman-applet" # System tray for bluetooth
      #"nm-applet --indicator" # System tray for Network Manager
      #"swaync"
      # "hyprpaper"
    ];
  };

  services = {
    swaync.enable = true;
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    waybar.enable = true;
  };
}
