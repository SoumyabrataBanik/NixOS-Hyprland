{ config, ... }:
let
  palette = config.theme.palette;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      "col.active_border" = "rgba(${palette.color4}aa)";
      "col.inactive_border" = "rgba(${palette.background}aa)";
      "col.nogroup_border" = "rgba(${palette.background}ee)";
      "col.nogroup_border_active" = "rgba(${palette.color3}bc)";
      no_border_on_floating = false;
    };

    decoration = {
      dim_inactive = true;

      shadow = {
        enabled = false;
        color = "rgba(${palette.color0}aa);";
      };
    };

    group = {
      groupdbar = {
        "col.active" = "rba(${palette.color3}) rgb(${palette.color6}) 90deg";
        "col.inactive" = "rgba(${palette.color4}aa)";
      };
    };
  };
}
