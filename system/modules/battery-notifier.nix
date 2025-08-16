{ config, pkgs, ... }:
let
  battery-check-script = pkgs.writeShellScriptBin "battery-check" ''
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
    BATTERY_PATH=$(upower -e | grep 'battery')

    if [ -z "$BATTERY_PATH" ]; then
        exit 0
    fi

    PERCENTAGE=$(upower -i $BATTERY_PATH | grep "percentage" | awk '{ print $2 }' | sed 's/%//')
    STATE=$(upower -i $BATTERY_PATH | grep "state" | awk '{ print $2 }')

    STATE_FILE="/tmp/battery_notification_state.txt"

    send_notification() {
        LEVEL=$1 
        MESSAGE=$2
        ICON=$3
        ${pkgs.libnotify}/bin/notify-send -t 10000 -u critical -i "$ICON" "Battery Alert" "$MESSAGE"
        echo "$LEVEL" > "$STATE_FILE"
    }

    # Notification Logic

    if [ "$PERCENTAGE" -ge 99 ] && [ "$STATE" = "charging" ]; then
        if [ "$(cat $STATE_FILE 2>/dev/null)" != "full" ]; then
            send_notification "full" "Battery is Full (''${PERCENTAGE}%). Unplug the Adapter." "battery-full-charged"
        fi 

    elif [ "$PERCENTAGE" -ge 20 ] && [ "$STATE" = "discharging" ]; then
        if [ "$(cat $STATE_FILE 2>/dev/null)" != "low" ]; then
            send_notification "low" "Battery is Low (''${PERCENTAGE}%). Please plug in the Adapter." "battery-caution"
        fi 

    elif [ "$PERCENTAGE" -ge 50 ] && [ "$STATE" = "discharging" ]; then
        if [ "$(cat $STATE_FULE 2>/dev/null)" != "half" ]; then
            send_notification "half" "Battery is at ''${PERCENTAGE}%." "battery-good"
        fi 
    fi 
  '';
in
{
  systemd.user.services.battery-notifier = {
    description = "Periodic battery level notifier";
    script = "${battery-check-script}/bin/battery-check";
  };

  systemd.user.timers.battery-notifier = {
    description = "Run Battery Notifier every 5 minutes";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1m";
      OnUnitActiveSec = "5m";
      Unit = "battery-notifier.service";
    };
  };

  environment.systemPackages = with pkgs; [
    upower
    libnotify
  ];

  services.upower.enable = true;
}
