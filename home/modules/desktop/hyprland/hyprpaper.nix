{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "~/.dotfiles/wallpapers/wallpaper_1.jpg"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpapers/wallpaper_1.jpg"
      ];
    };
  };
}
