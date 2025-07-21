{ pkgs, ... }:

{
    home.packages = [
        pkgs.open-webui
    ];

    programs.zsh.shellAliases = {
        ow = "${pkgs.open-webui}/bin/open-webui serve --port 3000";
    };
}
