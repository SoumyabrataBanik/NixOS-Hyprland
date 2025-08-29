{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = [
    inputs.sillytavern.packages.${pkgs.system}.default
  ];

  home.sessionVariables = {
    SILLYTAVERN_DATAROOT = "${config.home.homeDirectory}/.sillytavern";
  };

  programs.zsh.shellAliases = {
    st = "sillytavern";
  };
}
