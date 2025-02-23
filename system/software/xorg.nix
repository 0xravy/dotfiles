{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us,ara";
    xkb.options = "grp:rctrl_rshift_toggle,caps:escape";
  };
}
