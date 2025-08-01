{
    services = {
        blueman-applet.enable = true;
        network-manager-applet.enable = true;

        home-manager = {
            autoExpire = {
                enable = true;
                frequency = "weekly";
                timestamp = "-7 days";
            };
        };
    };
}
