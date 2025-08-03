{ pkgs, pkgs-unstable, ... }:

let
  coreutils = pkgs.coreutils;
  Hyprshot = pkgs-unstable.hyprshot;
  Hyprlock = pkgs-unstable.hyprlock;
  Systemd = pkgs.systemd;

  take-screenshot = pkgs.writeShellScriptBin "take-screenshot" ''
    #!${pkgs.runtimeShell}
    LOCK_DIR="/tmp/lockscreen"
    ${coreutils}/bin/mkdir -p "$LOCK_DIR"
    ${coreutils}/bin/rm -rf "$LOCK_DIR"/*
    ${Hyprshot}/bin/hyprshot -s -f 1.png -o "$LOCK_DIR" -m output -m eDP-1
  '';

  screen-suspend = pkgs.writeShellScriptBin "screen-suspend" ''
    #!${pkgs.runtimeShell}
    ${take-screenshot}/bin/take-screenshot
    ${coreutils}/bin/sleep 1
    ${Hyprlock}/bin/hyprlock &
    ${coreutils}/bin/sleep 1
    ${Systemd}/bin/systemctl suspend
  '';

  lock-screen = pkgs.writeShellScriptBin "lock-screen" ''
    #!${pkgs.runtimeShell}
    ${take-screenshot}/bin/take-screenshot
    ${coreutils}/bin/sleep 1
    ${Hyprlock}/bin/hyprlock
  '';
in
{
  home.packages = [
    pkgs-unstable.hyprlock
    pkgs-unstable.hyprshot
    take-screenshot
    screen-suspend
    lock-screen
  ];
}

# {
#   home.file.".local/bin/screensuspend" = {
#     executable = true;
#
#     text = ''
#       mkdir -p /tmp/lockscreen
#       rm -rf /tmp/lockscreen/*
#       sleep 0.2
#       hyprshot -s -f 1.png -o /tmp/lockscreen/ -m output -m eDP-1
#       sleep 0.5
#       hyprlock & sleep 1
#       systemctl suspend
#     '';
#   };
# }
