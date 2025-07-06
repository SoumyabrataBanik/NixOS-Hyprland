{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        oh-my-zsh
    ];

    programs.zsh.enable = true;
}
