{ config, pkgs, ... }:

{
    
    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
        firefox
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
	    zathura
        bluez
        blueman
        poetry
        onlyoffice-desktopeditors
    ];
}
