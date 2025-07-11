{ config, pkgs, ... }:

{
    
    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
        firefox
        neovim
        kitty
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
	    zathura
        bluez
        blueman
        poetry
        onlyoffice-desktopeditors
    ];
}
