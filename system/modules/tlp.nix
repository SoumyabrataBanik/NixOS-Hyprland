{ config, pkgs, ... }:

{
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;

    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_BOOST_ON_AC = 1;
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      #CPU_DRIVER_OPMODE_ON_AC = "active";

      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_BAT = 0;
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      # CPU_DRIVER_OPMODE_ON_BAT = "active";

      CPU_MIN_PERF_ON_AC = 10;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 50;

      START_CHARGE_THRESH_BAT0 = 99;
      STOP_CHARGE_THRESH_BAT0 = 100;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "on";

      USB_AUTOSUSPEND = 0;
      USB_DENYLIST = "8087:0a2b";
      USB_EXCLUDE_BTUSB = 1;

      MEM_SLEEP_ON_AC = "deep";
      MEM_SLEEP_ON_BAT = "deep";

      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";

      RADEON_POWER_PROFILE_ON_AC = "auto";
      RADEON_POWER_PROFILE_ON_BAT = "low";

      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

      NMI_WATCHDOG = 0;
      RESTORE_DEVICE_STATE_ON_STARTUP = 1;
    };
  };
}
