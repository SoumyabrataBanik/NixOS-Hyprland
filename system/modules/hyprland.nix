{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        hyprpaper
        hyprlock
        hypridle
        hyprshot
        rofi-wayland
        wlogout
        wl-clipboard
        dunst
        qt5.qtwayland
        qt6.qtwayland
        grim
        waybar
        networkmanagerapplet
        wireplumber
        xfce.thunar
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
    ];

    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };

    services.blueman.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
}
