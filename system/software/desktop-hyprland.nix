{
  pkgs,
  mySettings,
  ...
}: {
  # hyprland
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  environment.variables = {
    XKB_DEFAULT_LAYOUT = mySettings.user.keyboard.layout; # Keyboard layout
    XKB_DEFAULT_VARIANT = ""; # Variant if needed
    XKB_DEFAULT_OPTIONS = mySettings.user.keyboard.options; # XKB options
  };

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
    grim
    slurp # Screenshot tools
    xdg-desktop-portal-wlr # Wayland portal for Hyprland
    flameshot
    grimblast
    xdg-desktop-portal-hyprland
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    GTK_THEME = "Adwaita";
  };

  services.dbus.enable = true;

  # (Optional) For laptop users: Power management
  services.tlp.enable = true;

  # GPU Drivers
  # hardware.opengl = {
  #   enable = true;
  #   driSupport32Bit = true;
  #   extraPackages = with pkgs; [
  #     vaapiVdpau
  #     libva-utils
  #   ];
  # };

  # Set Hyprland as the default session
  # services.xserver.windowManager.default = "hyprland";
}
