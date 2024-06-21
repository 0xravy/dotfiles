{
  pkgs,
  lib,
  ...
}: {
  gtk.cursorTheme.package = pkgs.apple-cursor;
  gtk.cursorTheme.name = "macOS-BigSUr-White";
  #gtk.cursorTheme.size = 16;

  gtk.theme.package = lib.mkDefault pkgs.gruvbox-dark-gtk;
  gtk.theme.name = lib.mkDefault "gruvbox-dark";

  gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
  gtk.iconTheme.name = "oomox-gruvbox-dark";

  xdg.configFile."lf/icons".source = ./icons;
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
            printf "Directory Name: "
        	read DIR
        	mkdir $DIR
        }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "swww img %f% --transition-fps 30 --transition-type any --transition-duration 1";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';


      # ...
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
           file=$1
           w=$2
           h=$3
           x=$4
           y=$5

           if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
        ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
            fi

            ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };
}
