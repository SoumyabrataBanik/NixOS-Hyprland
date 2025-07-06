let
    configDir = ../config;
in
{
	home.file = {
	    ".config/nvim".source = "${configDir}/nvim";
    	    ".config/kitty".source = "${configDir}/kitty";
	    ".config/hypr".source = "${configDir}/hypr";
      	    ".config/waybar".source = "${configDir}/waybar";
      	    ".config/starship.toml".source = "${configDir}/starship.toml";
	    ".config/fastfetch".source = "${configDir}/fastfetch";
	    ".config/dunst".source = "${configDir}/dunst";
	    ".config/rofi".source = "${configDir}/rofi";
	    ".config/yazi".source = "${configDir}/yazi";
	    ".config/tmux".source = "${configDir}/tmux";
	    ".config/wlogout".source = "${configDir}/wlogout";
	    ".config/zathura".source = "${configDir}/zathura";
	};
}
