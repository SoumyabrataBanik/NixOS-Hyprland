{ config, pkgs, ... }:

{
    
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    ];
}
