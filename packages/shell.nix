# Testing PKG_CONFIG_PATH with nix-shell
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "test";
  nativeBuildInputs = [
    #pkgs.pkg-config
  ];
  buildInputs = with pkgs; [
    #gdb
    #gst_all_1.gstreamer
    #(pkgs.callPackage ./gst-rockchip.nix {})
    (pkgs.callPackage ./rknpu2.nix {})
    (pkgs.callPackage ./rknpu2-examples.nix {})
  ];
}
