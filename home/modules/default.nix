{ ... }:

{
  imports = [
    ./config.nix
    ./apps
    ./desktop
    ./services
    ./shell
    ./system
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
}
