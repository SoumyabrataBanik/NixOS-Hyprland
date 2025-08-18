{ pkgs-unstable, ... }:

{
  imports = [
    ./settings.nix
    ./style.nix
  ];

  services.swaync = {
    enable = true;
    package = pkgs-unstable.swaynotificationcenter;
  };
}
