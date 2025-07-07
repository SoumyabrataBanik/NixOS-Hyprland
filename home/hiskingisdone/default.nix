{ inputs, ... }:

{
    imports = [
    	./config.nix
        ./environment.nix
        ./fonts.nix
        ./git.nix
        ./gtk.nix
        ./languages.nix
        ./open-webui.nix
        ./programs.nix
        ./services.nix
        ./zsh.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
    };
}
