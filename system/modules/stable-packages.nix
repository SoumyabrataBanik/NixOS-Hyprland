{ config, pkgs, pkgs-unstable, ... }:

{
    
    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
        firefox
        zen-browser
        fzf
        eza
        yazi
        fastfetch
        brightnessctl
        killall
        bat
        btop
        gnumake
        ripgrep
        tldr
        unzip
	    tmux
    ];
}
