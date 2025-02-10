{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = [
    pkgs.home-manager

    # ===> NETWORKING
    pkgs.networkmanagerapplet

    # ===> TOOLS
    pkgs.fastfetch
    pkgs.nerdfetch
    pkgs.lazygit
    pkgs.bat
    pkgs.themechanger
    pkgs.pistol
    pkgs.ctpv
    pkgs.cava
    pkgs.gromit-mpx
    pkgs.vlc
    pkgs.fzf
    pkgs.fd
    pkgs.picom
    pkgs.rofi
    pkgs.wofi
    pkgs.pkg-config
    pkgs.feh
    pkgs.xorg.xinit
    pkgs.xorg.xrandr
    pkgs.arandr
    pkgs.wdisplays
    pkgs.scrcpy
    pkgs.warpd
    pkgs.dunst
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.light
    pkgs.xwinwrap
    pkgs.ffmpeg
    pkgs.tty-clock
    pkgs.sqlite
    pkgs.cmatrix
    pkgs.hollywood
    pkgs.stow
    pkgs.lazysql
    pkgs.zoxide
    pkgs.jq

    # ==> APPS
    pkgs.superTuxKart
    pkgs.firefox
    pkgs.telegram-desktop
    pkgs.polybar
    pkgs.wl-clipboard
    pkgs.util-linux
    pkgs.neovim
    pkgs.lf
    pkgs.eza
    pkgs.wget
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.mpd
    pkgs.mpv
    pkgs.xwinwrap
    pkgs.fuzzel
    pkgs.tofi
    pkgs.tmux
    pkgs.btop
    pkgs.nvtopPackages.full
    pkgs.zip
    pkgs.unzip
    pkgs.xfce.thunar
    pkgs.gnumake
    pkgs.ripgrep
    pkgs.xcolor
    pkgs.xclip
    pkgs.light
    pkgs.gns3-server
    pkgs.postman
    pkgs.pavucontrol
    pkgs.obs-studio
    pkgs.obsidian
    # pkgs.discord
    pkgs.brave
    pkgs.google-chrome
    pkgs.gimp
    pkgs.gparted
    pkgs.zed-editor
    pkgs.vscode
    pkgs.gnome-calculator
    pkgs.waypaper
    pkgs.wireshark
    pkgs.mission-center
    # pkgs.ciscoPacketTracer8
    pkgs.zathura
    pkgs.pcmanfm
    pkgs.lxqt.lxqt-policykit
    pkgs.libreoffice-qt-fresh
    pkgs.anki-bin
    pkgs.gnome-clocks
    pkgs.screenkey
    pkgs.lxappearance
    pkgs.sqlitebrowser
    pkgs.cool-retro-term
    pkgs.appimage-run
    pkgs.gns3-gui
    pkgs.prismlauncher

    # ===> PROGRAMMING LNAGUAGES

    # => NIX
    pkgs.nixd # NIX lsp
    pkgs.alejandra # NIX formatter

    # => C/C++
    pkgs.gcc # C compiler
    pkgs.clang # C++ compiler

    # => deno
    pkgs.deno # JS compiler

    # => bun
    pkgs.bun # JS compiler

    # => nodejs
    pkgs.nodejs_22 # NodeJS compiler
    pkgs.nodePackages.live-server # liveserver package
    pkgs.svelte-language-server

    # => python
    pkgs.python3 # PY compiler
    pkgs.python311Packages.pip # PY package manager

    # => rust
    pkgs.rustup # RUST tolls
    pkgs.rust-analyzer # RUST LSP

    # => java
    # pkgs.openjdk22
    # jdk8_headless
    # jre8
    # pkgs.javaPackages.openjfx22
    # pkgs.jdt-language-server

    # => go
    pkgs.libcap
    pkgs.go # GO compiler
    pkgs.gofumpt # GO formatter
    pkgs.goimports-reviser # GO formatter
    pkgs.golines # GO formatter

    # => lua
    pkgs.lua # LUA compiler
    pkgs.lua-language-server # LUA lsp
    pkgs.luajitPackages.luarocks # LUA package manager
  ];
}
