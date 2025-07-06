{ pkgs, ... }:

{
    home.file = {
        ".local/bin/open-webui" = {
            executable = true;
            text = ''
                DATA_DIR=~/.open-webui uvx --python 3.11 open-webui@latest serve
            '';
        };
    };
}
