{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  environment.systemPackages = with pkgs-unstable; [
    hyprpaper
    hyprlock
    hypridle
    hyprshot
    rofi
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
    swaynotificationcenter
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = pkgs-unstable.hyprland;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-volman ];
    };
  };

  services.blueman.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
}
