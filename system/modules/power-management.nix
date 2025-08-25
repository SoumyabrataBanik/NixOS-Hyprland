{ config, pkgs, ... }:

{
  services.power-profiles-daemon.enable = false;

  services.asusd.enable = false;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        scaling_min_freq = 1400000;
        turbo = "auto";
      };
      battery = {
        governor = "schedutil";
        scaling_min_freq = 1400000;
        turbo = "never";
      };
    };
  };

  services.tlp = {
    enable = false;

    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;

      CPU_SCALING_MIN_FREQ_ON_AC = 1400000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 1400000;

      CPU_SCALING_MAX_FREQ_ON_BAT = 2100000;

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      #CPU_MIN_PERF_ON_AC = 10;
      #CPU_MAX_PERF_ON_AC = 100;
      #CPU_MIN_PERF_ON_BAT = 0;
      #CPU_MAX_PERF_ON_BAT = 60;

      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 100;

      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "on";

      USB_AUTOSUSPEND = 0;
      USB_DENYLIST = "8087:0a2b";
      USB_EXCLUDE_BTUSB = 1;

      #MEM_SLEEP_ON_AC = "deep";
      #MEM_SLEEP_ON_BAT = "deep";

      #RADEON_DPM_STATE_ON_AC = "performance";
      #RADEON_DPM_STATE_ON_BAT = "battery";

      #RADEON_POWER_PROFILE_ON_AC = "auto";
      #RADEON_POWER_PROFILE_ON_BAT = "low";

      #RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      #RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

      NMI_WATCHDOG = 0;
      RESTORE_DEVICE_STATE_ON_STARTUP = 1;
    };
  };
}
