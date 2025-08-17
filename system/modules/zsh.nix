{ config, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    package = pkgs-unstable.zsh;
  };
}
