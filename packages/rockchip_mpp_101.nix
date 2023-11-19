{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation {
  name = "rockchip_mpp";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "rockchip-linux";
    repo = "mpp";
    rev = "1.0.1";
    sha256 = "jwWNYV2sYQoatoY1CnL+gB2Z9Hg3G+5TPNX0QjznoDQ=";
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
