{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "~/.dotfiles/wallpapers/wallpaper_2.png"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpapers/wallpaper_2.png"
      ];
    };
  };
}
