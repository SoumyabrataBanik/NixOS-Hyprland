{ pkgs, ... }:

{
    home.file = {
        ".local/bin/waybar-reload" = {
            executable = true;
            text = ''
                pkill -SIGUSR2 waybar
            '';
        };
    };
}
