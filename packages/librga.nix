{ stdenv, fetchFromGitHub, pkgs }:

stdenv.mkDerivation {
  name = "librga";
  version = "20201124";

  src = fetchFromGitHub {
    owner = "lihuang1111";
    repo = "linux-rga";
    rev = "cec3dbb1d490c034d55abf47e3d0a076888f7666";
    sha256 = "8jNXAwpo+V57QvsQDKgzHxEOqEJlJ6ZlHOQk+kjaFXo=";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.meson pkgs.ninja ];
  buildInputs = [ pkgs.libdrm ];

  installPhase = ''
    mkdir -p "$dev/include"
    mkdir -p "$dev/lib/pkgconfig"
    cp -r "../include" "$dev/include/rga"
    cp meson-private/librga.pc "$dev/lib/pkgconfig"
    mkdir -p "$out/lib"
    cp -a librga.so librga.so.2 librga.so.2.0.0 "$out/lib"
  '';

  outputs = [ "dev" "out" ];
}
