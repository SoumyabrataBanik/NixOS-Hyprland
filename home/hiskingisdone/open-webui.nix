{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.open-webui
  ];

  home.sessionVariables = {
    DATA_DIR = "${config.home.homeDirectory}/.open-webui";
    WEBUI_SECRET_KEY = "${config.home.homeDirectory}/.open-webui/.webui_secret_key";
  };

  programs.zsh.shellAliases = {
    ow = "${pkgs.open-webui}/bin/open-webui serve";
  };
}
