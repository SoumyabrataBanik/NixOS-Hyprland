{ config, pkgs, ... }:

{
  hardware = {
    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        amdvlk
        libvdpau-va-gl
        libva-utils
      ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  environment.variables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER = "va_gl";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
