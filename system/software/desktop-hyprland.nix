{
  pkgs,
  mySettings,
  inputs,
  ...
}: {
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Enable XWayland for X11 compatibility
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Keyboard layout and options
  environment.variables = {
    XKB_DEFAULT_LAYOUT = mySettings.user.keyboard.layout; # Keyboard layout
    XKB_DEFAULT_VARIANT = ""; # Variant if needed
    XKB_DEFAULT_OPTIONS = mySettings.user.keyboard.options; # XKB options
  };

  # System packages for Hyprland
  environment.systemPackages = with pkgs; [
    swww # Background cli
    hyprland # Hyprland itself
    waybar # Status bar
    alacritty # Terminal emulator
    dunst # Notification daemon
    rofi # Application launcher
    wofi # Application launcher
    wl-clipboard # Clipboard manager
    light # Brightness control
    grim # Screenshot tools
    slurp
    flameshot
    grimblast
    gnome-themes-extra # GTK themes
    adwaita-icon-theme # Default icons for GTK
    xdg-desktop-portal-gtk # Screen sharing (GTK integration)
  ];

  # Environment variables for Wayland
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland"; # Enable Wayland for Qt applications
    GDK_BACKEND = "wayland"; # Enable Wayland for GTK applications
    SDL_VIDEODRIVER = "wayland"; # Enable Wayland for SDL applications
    CLUTTER_BACKEND = "wayland"; # Enable Wayland for Clutter applications
    NIXOS_OZONE_WL = "1"; # Enable Wayland for Electron apps
    MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland for Firefox
    XDG_CURRENT_DESKTOP = "Hyprland"; # Set the desktop environment to Hyprland
    XDG_SESSION_TYPE = "wayland"; # Force Wayland session
  };

  # Enable D-Bus
  services.dbus.enable = true;

  # Enable xdg-desktop-portal for screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Enable wlr integration for Hyprland
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # (Optional) For laptop users: Power management
  services.tlp.enable = true;

  # GPU Drivers (uncomment if needed)
  # hardware.opengl = {
  #   enable = true;
  #   driSupport32Bit = true;
  #   extraPackages = with pkgs; [
  #     vaapiVdpau
  #     libva-utils
  #   ];
  # };

  # Set Hyprland as the default session (if using a display manager)
  # services.xserver.windowManager.default = "hyprland";
}
