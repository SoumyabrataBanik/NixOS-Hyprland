{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    auto-cpufreq
  ];

  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq.enable = true;
  };
}
