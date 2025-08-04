{ ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      "default" = {
        ids = [ "*" ];
        settings = {
          main = {
            esc = "noop";
            rightalt = "esc";
          };
        };
      };
    };
  };
}
