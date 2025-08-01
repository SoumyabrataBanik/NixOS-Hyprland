{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmuxifier
  ];

  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";

    keyMode = "vi";

    prefix = "C-b";

    mouse = true;

    # tmuxinator.enable = true;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "git cpu-usage ram-usage battery time"
          set -g @dracula-cpu-usage-label ""
          set -g @dracula-ram-usage-label ""
          set -g @dracula-show-powerline true
          set -g @dracula-show-right-sep 
          set -g @dracula-show-left-sep 
          set -g @dracula-show-flags false
          set -g @dracula-show-left-icon hostname
          set -g @dracula-border-contrast true
          set -g @dracula-time-format "%R"
          set -g @dracula-git-show-remote-status false
          set -g @dracula-git-disable-status true
        '';
      }
      cpu
      battery
    ];

    extraConfig = ''
      # Binding tmux source file
      unbind z
      bind z source-file ~/dotfiles/.config/tmux/tmux.conf


      # Binding kill-session
      unbind q
      bind q command-prompt "kill-session"

      # Binding key to hide and show panes
      bind-key ! break-pane -d -n _hidden_pane
      bind-key @ join-pane -s $.0

      # Set options
      set-option -g mouse on
      set-option -g status-position top

      # Enable underline in TMUX
      # Undercurl
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
    '';

  };
}
