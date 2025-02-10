{pkgs, ...}: {
  home.packages = with pkgs; [
    # cyper tools
    openvpn
    nmap
    # john
    inetutils
  ];
}
