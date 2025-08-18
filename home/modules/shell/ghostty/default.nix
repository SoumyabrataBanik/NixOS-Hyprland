{ ... }:

{
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      theme = "Dracula+";
      font-family = "0xProto Nerd Font Mono";
      font-size = 12;
      background-opacity = 0.7;
      background-blur = 5;
      title = " ";
      keybind = [
        "ctrl+j=scroll_page_down"
        "ctrl+k=scroll_page_up"
        "ctrl+t=new_tab"
        "ctrl+q=close_tab"
        "ctrl+i=new_split:right"
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
        "ctrl+tab=move_tab:1"
        "ctrl+shift+tab=move_tab:-1"
        "ctrl+1=goto_tab:1"
        "ctrl+2=goto_tab:2"
        "ctrl+3=goto_tab:3"
        "ctrl+4=goto_tab:4"
        "ctrl+5=goto_tab:5"
        "super+ctrl+shift+h=resize_split:left,10"
        "super+ctrl+shift+l=resize_split:right,10"
        "super+ctrl+shift+k=resize_split:up,10"
        "super+ctrl+shift+j=resize_split:down,10"
      ];
      confirm-close-surface = false;
      window-padding-x = 10;
      window-padding-y = "10, 2";
    };
  };
}
