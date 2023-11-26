# Testing PKG_CONFIG_PATH with nix-shell
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "test";
  nativeBuildInputs = [
    pkgs.pkgconfig
  ];
  buildInputs = with pkgs; [
    gdb
    gst_all_1.gstreamer
    (pkgs.callPackage ./gst-rockchip.nix {})
  ];
}
#pkgs.callPackage ./libv4l-rkmpp.nix {}
