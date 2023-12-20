{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation {
  name = "rockchip_mpp";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "rockchip-linux";
    repo = "mpp";
    rev = "1.0.2";
    sha256 = "kvAgJ5dohc9V7XwtoOEgXpspsb2Tn6JSQIu6B1EPFSs=";
  };

  postPatch = ''
    substituteInPlace pkgconfig/rockchip_mpp.pc.cmake \
      --replace 'libdir=''${prefix}/'     'libdir=' \
      --replace 'includedir=''${prefix}/' 'includedir='

    substituteInPlace pkgconfig/rockchip_vpu.pc.cmake \
      --replace 'libdir=''${prefix}/'     'libdir=' \
      --replace 'includedir=''${prefix}/' 'includedir='
  '';

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [ "-DRKPLATFORM=ON" ];

  outputs = [ "lib" "dev" "out" ];
}
