{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = lib.mkForce "1";
      enable_audio_bell = "no";
    };
  };
}
