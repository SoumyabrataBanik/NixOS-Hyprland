{ pkgs, ... }:

{
  services = {
    asusd = {
      enable = true;
    };
    power-profiles-daemon.enable = true;
  };
}
