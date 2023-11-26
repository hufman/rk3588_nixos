{ stdenv, fetchgit, pkgs }:

stdenv.mkDerivation {
  name = "gst-rockchip";
  version = "20211207";

  src = fetchgit {
    url = "https://gitlab.com/firefly-linux/external/gstreamer-rockchip.git";
    rev = "fc23bdd6172e0d4125a170b573dc804a58442827";
    sha256 = "wfM0lx0pOZko+SD2ydqvqZshJyZO8IFX+XbrEuaydB8=";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.meson pkgs.ninja ];
  buildInputs = [
    pkgs.gst_all_1.gstreamer
    pkgs.gst_all_1.gst-plugins-base
    pkgs.xorg.libX11
    pkgs.libdrm
    (pkgs.callPackage ./librga.nix {})
    (pkgs.callPackage ./rockchip_mpp_101.nix {})
  ];

  outputs = [ "dev" "out" ];

}
