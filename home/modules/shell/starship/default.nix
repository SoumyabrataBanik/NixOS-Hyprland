{ pkgs-unstable, ... }:

{
  programs.starship = {
    enable = false;
    package = pkgs-unstable.starship;
    enableZshIntegration = true;
  };

  #programs.zsh.initContent = ''
  #  eval "$(starship init zsh)"
  #'';
}
