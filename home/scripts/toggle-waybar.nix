{ pkgs, ... }:

{
    home.file = {
        ".local/bin/waybar-toggle" = {
            executable = true;

            text = ''
                if pgrep -x "waybar" > /dev/null
                then
                    killall waybar
                else
                    waybar &
                fi
            '';
        };
    };
}
