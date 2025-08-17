let
  configDir = ../config;
in
{
  home.file = {
    ".config/alacritty".source = "${configDir}/alacritty";
    # ".config/nvim".source = "${configDir}/nvim";
    #".config/nvim" = {
    #  source = "${configDir}/nvim-nix";
    #  recursive = true;
    #};
    ".config/kitty".source = "${configDir}/kitty";
    # ".config/hypr".source = "${configDir}/hypr";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/starship.toml".source = "${configDir}/starship.toml";
    ".config/fastfetch".source = "${configDir}/fastfetch";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/yazi".source = "${configDir}/yazi";
    # ".config/tmux".source = "${configDir}/tmux";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/zathura".source = "${configDir}/zathura";
    ".config/swaync".source = "${configDir}/swaync";
  };
}
