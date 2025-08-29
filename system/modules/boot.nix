{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "atkbd.reset"
      "amd_pstate=disabled"
    ];

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = true;
        theme = pkgs.stdenv.mkDerivation {
          pname = "distro-grub-themes";
          version = "3.2";
          src = pkgs.fetchFromGitHub {
            owner = "AdisonCavani";
            repo = "distro-grub-themes";
            rev = "v3.2";
            hash = "sha256-U5QfwXn4WyCXvv6A/CYv9IkR/uDx4xfdSgbXDl5bp9M=";
          };
          buildPhase = ''
            mkdir -p $out/distro-grub-themes
            tar -xvf themes/nixos.tar -C $out/distro-grub-themes
          '';
          installPhase = ''
            cp -r $out/distro-grub-themes/* $out/ && rm -r $out/distro-grub-themes
          '';
        };
      };

      timeout = 60;
    };
  };
}
