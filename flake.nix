{
  description = "Flakes for Soumyabrata Banik";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Sops-Nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen-Browser
    zen-browser = {
      url = "github:SoumyabrataBanik/flake-zen-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Open-Webui
    open-webui = {
      url = "github:SoumyabrataBanik/open-webui-flake";
    };

    sillytavern = {
      url = "github:SoumyabrataBanik/SillyTavern-Flake";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      sops-nix,
      sillytavern,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      my-overlays = import ./overlays.nix inputs;
    in
    {
      nixosConfigurations.nixstar = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          ({ nixpkgs.overlays = [ my-overlays ]; })
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
      };

      homeConfigurations = {
        hiskingisdone = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home
            ({ nixpkgs.overlays = [ my-overlays ]; })
          ];
          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit inputs;
          };
        };
      };
    };
}
