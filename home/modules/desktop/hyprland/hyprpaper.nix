{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "~/.dotfiles/wallpapers/wallpaper_1.png"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpapers/wallpaper_1.png"
      ];
    };
  };
}
