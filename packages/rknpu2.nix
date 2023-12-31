{ stdenv, lib, fetchgit, autoPatchelfHook }:

stdenv.mkDerivation rec {
  name = "rknpu2";
  version = "1.6.0";

  src = fetchgit {
    url = "https://github.com/airockchip/rknn-toolkit2.git";
    rev = "v${version}";
    sha256 = "+xlfqil13x026nj+WQsg5jKK0E31SF494xc+OgW1eD8=";
    sparseCheckout = [
      "rknpu2/runtime/Linux"
    ];
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ stdenv.cc.cc ];


  installPhase = ''
    runHook preInstall
    install -m 755 -D -t $out/bin $src/rknpu2/runtime/Linux/rknn_server/aarch64/usr/bin/rknn_server
    runHook postInstall
  '';

  outputs = [ "out" ];

}
