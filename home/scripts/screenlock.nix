{
  home.file.".local/bin/screenlock" = {
    executable = true;

    text = ''
      mkdir -p /tmp/lockscreen
      rm -rf /tmp/lockscreen/*
      sleep 0.1
      hyprshot -s -f 1.png -o /tmp/lockscreen/ -m output -m eDP-1
      sleep 0.5
      hyprlock
    '';
  };
}
