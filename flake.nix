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

          # Zen Browser
          zen-browser = {
              url = "github:0xc000022070/zen-browser-flake";
              inputs.nixpkgs.follows = "nixpkgs";
          };

          # Sops-Nix
          sops-nix = {
              url = "github:Mic92/sops-nix";
              inputs.nixpkgs.follows = "nixpkgs";
          };

    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, sops-nix, ... }@inputs:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        in
    {
            nixosConfigurations.nixstar = lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/configuration.nix
                ];
                specialArgs = {
                    inherit pkgs-unstable;
                };
            };

            homeConfigurations = {
                hiskingisdone = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [
                        ./home
                    ];
                    extraSpecialArgs = {
                        inherit pkgs-unstable;
                        inherit inputs;
                    };
                };
            };
    };
}
