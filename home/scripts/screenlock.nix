{
  home.file.".local/bin/screenlock" = {
    executable = true;

    text = ''
      mkdir -p /tmp/lockscreen
      hyprshot -f 1.png -o /tmp/lockscreen/ -m active
      hyprlock
    '';
  };
}
