{ ... }:
let
  theme = import ./themes/Urban_Nocturne.nix { };
  palette = theme.palette;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };
      auth = {
        "fingerprint:enabled" = true;
        "pam:enabled" = false;
      };

      background = {
        monitor = "";
        path = "/tmp/lockscreen/1.png";
        blur_passes = 1;
        blur_size = 7;
        noise = 0.0117;
        vibrancy = 0.1696;
      };

      label = [
        {
          monitor = "";
          text = "Soumyabrata Banik";
          text_align = "center";
          color = "rgba(${palette.color15}fe)";
          font_size = 50;
          font_family = "MonaspiceXe Nerd Font";
          rotate = 0;
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Enter Password";
          text_align = "center";
          color = "rgba(${palette.color9}fe)";
          font_size = 20;
          font_family = "MonaspiceXe Nerd Font";
          rotate = 0;
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        monitor = "";
        size = "500, 50";
        outer_color = "rgba(${palette.color3}00)";
        inner_color = "rgba(${palette.color7}ab)";
        placeholder_text = "";
        fade_on_empty = false;
        hide_input = false;
        hide_input_base_color = "rgba(${palette.color2}ff)";
        rounding = -1;
        position = "0, 0";
      };
    };
  };
}
