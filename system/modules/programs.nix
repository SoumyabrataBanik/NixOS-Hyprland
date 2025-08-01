{ config, pkgs, ... }:

{
    programs = {
        xwayland = {
            enable = true;
        };

        yazi = {
            enable = true;
        };

        thunar = {
            enable = true;
        };

	      tmux.enable = true;

    };
}
