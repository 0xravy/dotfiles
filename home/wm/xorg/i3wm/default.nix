{ config, pkgs, ... }:

{
    xsession.windowManager.i3 = {
        enable = true;
    };

    home.file."./.config/i3" = {
        source = ./i3-conf;
        recursive = true;
    };
}
