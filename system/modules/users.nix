{ config, pkgs, ... }:

{

  users.users.hiskingisdone = {
    isNormalUser = true;
    description = "HisKingIsDone";
    extraGroups = [
      "networkmanager"
      "wheel"
      "render"
      "video"
    ];
    shell = pkgs.zsh;
    useDefaultShell = true;
  };

  environment.localBinInPath = true;

  environment.homeBinInPath = true;
}
