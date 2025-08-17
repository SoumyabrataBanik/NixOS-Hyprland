{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    kitty
    alacritty
    neovim
    bluez
    blueman
    ghostty
    onlyoffice-desktopeditors
    zathura
  ];
}
