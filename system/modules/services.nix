{ config, ... }:

{

  services = {

    dbus.enable = true;

    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing.enable = true;

    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    libinput.enable = true;

    logind = {
      powerKey = "ignore";
      powerKeyLongPress = "poweroff";
    };

    asusd.enable = true;
  };
}
