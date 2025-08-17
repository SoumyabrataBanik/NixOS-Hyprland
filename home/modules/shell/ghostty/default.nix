{ ... }:

{
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      theme = "Dracula+";
      font-family = "0xProto Nerd Font Mono";
      font-size = 12;
      background-opacity = 0.6;
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
      ];
      confirm-close-surface = false;
      window-padding-x = 5;
      window-padding-y = 5;
    };
  };
}
