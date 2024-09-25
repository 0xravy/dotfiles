{
  config,
  pkgs,
  inputs,
  mySettings,
  ...
}: let
  userDir = mySettings.userDir;
in {
  home.username = mySettings.user.name;
  home.homeDirectory = "/home/${mySettings.user.name}";

  imports = [
   "${userDir}/apps/desktop-i3wm"
   "${userDir}/apps/app-picom"
   "${userDir}/apps/editor-nvim"
   "${userDir}/apps/shell-lf"
   "${userDir}/apps/shell-zsh"
   "${userDir}/apps/shell-tmux"
   "${userDir}/apps/term-kitty"

   "${userDir}/style/font.nix"
   "${userDir}/style/gtk.nix"
  ];

  home.packages = with pkgs; [
    # ============> TOOLS
    fastfetch
    nerdfetch
    lazygit
    bat
    themechanger
    pistol
    ctpv
    cava
    gromit-mpx
    vlc
    fzf
    picom
    flameshot
    rofi
    pkg-config
    feh
    xorg.xinit

    # ============> APPS
    pavucontrol
    obs-studio
    obsidian
    discord
    brave
    gimp
    gparted
    zed-editor
    vscode
    gnome-calculator
    waypaper
    wireshark
    mission-center

    # games
    superTuxKart

    # ============> NETWORKING
    networkmanagerapplet

    # ============> LANGUAGE
    # rust
    rustup

    # java
    openjdk8-bootstrap
    # jdk8_headless
    # jre8
    javaPackages.openjfx11

    # C / C++
    clang
  ];

  services.syncthing.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";
      pictures = "${config.home.homeDirectory}/Pictures";
      templates = "${config.home.homeDirectory}/Templates";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      desktop = "${config.home.homeDirectory}/Desktop";
      publicShare = null;
      extraConfig = {
        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/dotfiles";
        XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
        XDG_MACHINES_DIR = "${config.home.homeDirectory}/Machines";
        XDG_BOOKS_DIR = "${config.home.homeDirectory}/Books";
        XDG_WALLPAPERS_DIR = "${config.home.homeDirectory}/Pictures/wallpapers";
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/screenshots";
        XDG_RECORDS_DIR = "${config.home.homeDirectory}/Videos/records";
      };
    };
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/http" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/https" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/about" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/unknown" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
    };
  };

  programs.git = {
    enable = true;
    userName = mySettings.user.github.name;
    userEmail = mySettings.user.github.email;
  };

  home.sessionVariables = {
    EDITOR = mySettings.user.editor;
    SPAWNEDITOR = mySettings.user.spawnEditor;
    TERM = mySettings.user.term;
    BROWSER = mySettings.user.browser;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
