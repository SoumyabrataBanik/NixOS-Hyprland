{ inputs, ... }: 

{
    imports = [
        inputs.zen-browser.homeModules.beta
    ];

    programs = {
        
        home-manager.enable = true;

        zen-browser.enable = true;

        open-webui.enable = true;
    };
}
