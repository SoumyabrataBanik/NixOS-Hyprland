{ config, pkgs, ... }:

{

  services = {

    dbus.enable = true;

    #xserver = {
    #  enable = false;
    #  displayManager.gdm.enable = true;
    #  desktopManager.gnome.enable = true;
    #  xkb = {
    #    layout = "us";
    #    variant = "";
    #  };
    #};

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
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
