{ pkgs, ... }: 

{
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
                  nerd-fonts.fira-code
                  nerd-fonts.zed-mono
                  nerd-fonts.victor-mono
                  nerd-fonts.space-mono
                  nerd-fonts.monaspace
                  nerd-fonts.meslo-lg
                  nerd-fonts.jetbrains-mono
                  nerd-fonts.fira-mono
                  nerd-fonts.iosevka
                  nerd-fonts.iosevka-term
                  nerd-fonts.iosevka-term-slab
                  font-awesome
                  powerline-fonts
    ];
}
