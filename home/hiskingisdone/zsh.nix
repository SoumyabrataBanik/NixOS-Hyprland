{ pkgs, ... }:
    let
        myAliases = { 
            c="clear";
            l="eza -lh  --icons=auto";
            ls="eza -1   --icons=auto";
            ll="eza -lha --icons=auto --sort=name --group-directories-first"; 
            ld="eza -lhD --icons=auto"; 
            lt="eza --icons=auto --tree";
            
            # System Upgrade
            rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
            homeRebuild = "home-manager switch --flake ~/.dotfiles";
            fullRebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles && home-manager switch --flake ~/.dotfiles";

            # Open-Webui
            start-webui = "sudo systemctl start podman-open-webui.service";
            stop-webui = "sudo systemctl stop podman-open-webui.service";
            status-webui = "sudo systemctl status podman-open-webui.service";
        };
    in
{
    home.packages = with pkgs; [
        starship
    ];

    programs = {

        # Enable Starship
        starship.enable = true;
        
        # Enable ZSH
        zsh = {
        	  enable = true;
	          syntaxHighlighting.enable = true;
	          autosuggestion.enable = true;
	          enableCompletion = true;
	          oh-my-zsh = {
	              enable = true;
                theme = "robbyrussell";
	          };
            shellAliases = myAliases;
            initContent = ''
                eval "$(starship init zsh)"
            '';
        };
    };  
}
