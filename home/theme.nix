{ lib, ... }:

{
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    description = "The Central Theme Definitions for the entire user environment.";
    readOnly = true;
  };

  config.theme = import ./themes/Nix_Nordic.nix;
}
