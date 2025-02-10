{pkgs, ...}: {
  # home.packages = with pkgs; [
  # ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      name = "Banana";
      package = pkgs.banana-cursor;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "gtk";
  #   style = {
  #     name = "Dracula";
  #     package = pkgs.dracula-qt5-theme;
  #   };
  # };
}
