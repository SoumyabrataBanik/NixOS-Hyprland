{ config, pkgs, ... }:

{
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;

    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
      CPU_BOOST_ON_AC = 1;
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_BAT = 0;
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 80;

      START_CHARGE_THRESH_BAT0 = 96;
      STOP_CHARGE_THRESH_BAT0 = 100;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "on";

      USB_AUTOSUSPEND = 0;
      USB_DENYLIST = "8087:0a2b";
      USB_EXCLUDE_BTUSB = 1;

    };
  };
}
