{ stdenv, fetchFromGitHub, pkgs }:

stdenv.mkDerivation {
  name = "libva-rockchip";
  version = "20161025";

  src = fetchFromGitHub {
    owner = "hizukiayaka";
    repo = "rockchip-video-driver";
    rev = "063cf2b4e94f55679f1db32ed934c27569718a68";
    sha256 = "w/L9KAU8Dm0595N4hFfzHpZvO0Fd4tE4sntwCToL1Tc=";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.cmake ];
  buildInputs = [ pkgs.libdrm pkgs.libva1 ];

  outputs = [ "dev" "out" ];
}
