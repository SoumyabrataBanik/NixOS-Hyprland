{ config, pkgs, pkgs-unstable, ... }:

{
    
    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
        firefox
        zen-browser
        neovim
        kitty
        alacritty
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
        bluez
        blueman
    ];

    environment.systemPackages = with pkgs-unstable; [
        ghostty-bin
        onlyoffice-desktopeditors
	    zathura
    ];
}
