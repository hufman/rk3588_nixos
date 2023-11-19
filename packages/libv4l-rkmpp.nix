# Doesn't seem to work, not sure if it's needed yet
{ stdenv, fetchFromGitHub, fetchpatch, pkgs ? import <nixpkgs> { overlays = [ (import ../overlays/libv4l.nix) ]; } }:

stdenv.mkDerivation {
  name = "libv4l-rkmpp";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "JeffyCN";
    repo = "libv4l-rkmpp";
    rev = "1.5.1";
    sha256 = "EGBeISd4FqQSbVNJXM8oULUu4g7CJdVsDhN2lveNGbE=";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.meson pkgs.ninja ];
  buildInputs = [
    (pkgs.callPackage ./rockchip_mpp_101.nix {})
    (pkgs.callPackage ./librga.nix {})
    (pkgs.v4l-utils.overrideAttrs (oldAttrs: rec {
      patches = (oldAttrs.patches or []) ++ [(fetchpatch {
        name = "0001-libv4l2-Support-mmap-to-libv4l-plugin.patch";
        url = "https://raw.githubusercontent.com/JeffyCN/meta-rockchip/release-1.3.0_20200915/recipes-multimedia/v4l2apps/v4l-utils/0001-libv4l2-Support-mmap-to-libv4l-plugin.patch";
        sha256 = "V04jJeSx1+7dx/+KTDHoccMvF5bBpzs0VESO0WN+u9M=";
      })];
    }))
  ];

  outputs = [ "lib" "out" ];
}
