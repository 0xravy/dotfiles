{ pkgs, ...}:

let

myAliases = {
    ls="exa --icons";
    lt="exa --icons --tree";
    la="exa -a -l --icons";
    lg="exa -a -l --icons --git";
    v="nvim";
    sv="sudo nvim";
    cat="bat -p";
    nixreb="sudo nixos-rebuild switch --flake";
    nixgar="sudo nix-collect-garbage -d; sudo nixos-rebuild boot";
};

in

{
	programs.zsh = {
		enable = true;
		shellAliases = myAliases;
		dotDir = ".config/zsh";
		enableCompletion = true;
		history = {
			expireDuplicatesFirst = true;
			extended = true;
			ignoreDups = true;
			path = ".config/zsh/.zsh_history";
			save = 10000;
			share = true;
		};

	        oh-my-zsh = {
	        	enable = true;
			plugins = [ 
				"git"
				"sudo"
				"terraform"
				"systemadmin"
				"vi-mode"
			];
	        	theme = "miloshadzic";
	        };

	        zplug = {
	        	enable = true;
	        	plugins = [
	        		{ name = "zsh-users/zsh-autosuggestions"; } 
	        	];
	        };
	};
}
