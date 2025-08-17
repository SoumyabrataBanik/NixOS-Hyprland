{ pkgs, ... }:

{
  services = {
    asusd = {
      enable = true;
      asusdConfig = {
        text = ''
          (
            bat_charge_limit: 100,
            charge_control_end_threshold: 100,
            ac_command: "",
            bat_command: "",
            ac_profile_tunings: {},
            dc_profile_tunings: {},
          )
        '';
      };
    };
    power-profiles-daemon.enable = true;
  };
}
