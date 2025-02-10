{
  config,
  mySettings,
  ...
}: let
  myAliases = {
    g = "cd $(fd -t d --full-path . $HOME | fzf )";
    gh = "cd $(fd -H -t d --full-path . $HOME | fzf )";
    c = "clear";
    b = "btop";
    t = "tmux";
    ls = "exa --icons";
    lt = "exa --icons --tree";
    la = "exa -a -l --icons";
    lg = "exa -a -l --icons --git";
    v = "nvim";
    sv = "sudo nvim";
    cat = "bat -p";
    bgv = "${mySettings.user.dotfilesDir}/user/scripts/bgv.sh -a";
    system-update = "sudo nixos-rebuild switch --flake ${mySettings.user.dotfilesDir}#${mySettings.system.hostname} --impure";
    user-update = "home-manager switch --flake ${mySettings.user.dotfilesDir} --impure";
    system-clean = "sudo nix-collect-garbage -d; sudo rm -rf /etc/nixos; sudo cp -r ${mySettings.user.dotfilesDir} /etc/nixos; sudo nixos-rebuild boot --impure";
  };
in {
  programs.zsh = {
    enable = true;
    initExtra = ''
         PROMPT="%F{yellow}%n%f%F{red}@%F{blue}%m%f%u:%F{magenta}%~%f %F{green}$%f "
         [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

                        clear
         echo """
         ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⠔⠉⠒⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠺⠤⠔⠁⠀⠀⢀⣀⠀⠀⠀⠑⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⢀⡰⠋⠉⠈⠉⠉⠳⠤⠔⢦⡈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⡜⠑⠂⠀⠀⠀⠀⠒⠄⠀⠀⣴⠃⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⢰⠄⢀⠆⠀⠰⢦⠀⠀⠀⢽⣳⣰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠔⠋⢹⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠠⣏⠀⠀⠀⠀⠀⠀⠀⠕⢻⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⢸⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⢠⡄⣀⣀⣀⠠⠴⣄⠀⠀⠀⠀⢈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⢀⣀⣠⣧⣀⠘⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡌⠉⠒⣦⠖⠒⠉⠉⠀⠀⣠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⢮⠀⢀⡀⠀⠙⡆⠘⣦⣤⣀⣀⣀⠀⠀⢀⣀⣀⣙⣦⡀⠀⠀⠀⠀⠀⠠⡾⠓⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⢸⠉⠉⠉⠉⠚⡅⢀⡟⡄⠀⠈⠉⠉⠉⠉⠀⠀⠀⢸⠉⠳⢶⣤⣀⡤⠖⠁⢀⡞⠀⠈⠓⢤⡀⠀⠀⠀⠀⠀⠀⠀
         ⠈⡗⠉⠓⠒⠲⡇⢸⢁⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⣀⣠⠴⠋⠀⠀⠀⠀⠀⠈⠲⣄⠀⠀⠀⠀⠀
         ⠀⠙⠶⢖⣒⣺⣵⣣⠊⠀⣀⣀⣀⡠⠤⠔⡿⠀⠀⠀⡞⠀⠀⠀⡞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠣⡀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⣇⠀⠀⠀⡇⠀⠀⠀⡇⠀⠀⠀⠀⢦⣄⣀⠀⠀⠀⠀⠀⠀⢙⣆⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠃⠀⠀⢸⠇⠀⠀⠀⠀⣿⣿⣿⠛⢲⡄⠀⠀⢀⣼⡿⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢰⠀⠀⠀⢸⠀⠀⠀⠀⢰⣿⣿⡟⢀⡞⠀⢀⣠⣿⣿⠃⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠦⢄⣈⠀⠀⠀⢸⠀⠀⠀⠀⣼⣿⣿⣇⡎⣠⣴⣿⣿⣿⠃⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠈⠀⠀⠀⠈⠓⠒⠒⠚⠋⠉⢸⡿⢿⣿⣿⣿⣿⠃⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⢄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣸⡇⠀⠉⡹⠻⡅⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀⠈⠉⠛⠒⠒⠒⠒⠚⣿⣿⣿⣿⣷⣀⣀⣙⣢⠇⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠈⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         """

         export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border top'

      eval "$(zoxide init zsh)"
    '';
    shellAliases = myAliases;
    dotDir = ".config/zsh";
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";
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
        {name = "zsh-users/zsh-autosuggestions";}
      ];
    };
  };
}
