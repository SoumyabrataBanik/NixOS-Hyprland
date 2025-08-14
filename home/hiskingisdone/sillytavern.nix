{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = [
    inputs.sillytavern.packages.${pkgs.system}.sillytavern
  ];

  home.sessionVariables = {
    SILLYTAVERN_DATAROOT = "${config.home.homeDirectory}/.sillytavern";
  };
}
