{ config, lib, pkgs, ... }:

{
	imports = [
		./bspwm/bspwm.nix
	];

	
	services.xserver = {
        	enable = true;
        	displayManager = {
        		sddm.enable = true;
        		setupCommands = ''
				LEFT='HDMI-1'
				RIGHT='eDP-1'
        			${pkgs.xorg.xrandr}/bin/xrandr --output $RIGHT --brightness 0.3 --mode 1920x1080 --pos 1600x0 --rotate normal --output $LEFT --brightness 1 --primary --mode 1600x900 --pos 0x0 --rotate normal
        		'';
        	};

		xkb.layout = "us, ara";
        	xkb.options = "grp:rctrl_rshift_toggle, caps:escape";
        };
}
