# Testing PKG_CONFIG_PATH with nix-shell
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "test";
  nativeBuildInputs = [
    pkgs.pkgconfig
    (pkgs.callPackage ./librga.nix {})
  ];
  buildInputs = with pkgs; [

    (pkgs.callPackage ./rockchip_mpp_101.nix {})
    (pkgs.callPackage ./librga.nix {})
  ];
}
#pkgs.callPackage ./libv4l-rkmpp.nix {}
