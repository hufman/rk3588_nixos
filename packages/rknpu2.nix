{ stdenv, lib, fetchgit, autoPatchelfHook }:

stdenv.mkDerivation {
  name = "rockchip_rknpu2";
  version = "1.6.0";

  src = fetchgit {
    url = "https://github.com/airockchip/rknn-toolkit2.git";
    rev = "v1.6.0";
    sha256 = "+xlfqil13x026nj+WQsg5jKK0E31SF494xc+OgW1eD8=";
    sparseCheckout = [
      "rknpu2/runtime/Linux"
    ];
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ stdenv.cc.cc ];


  installPhase = ''
    runHook preInstall
    install -m 555 -D -t $out/lib $src/rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so
    install -m 755 -D -t $out/bin $src/rknpu2/runtime/Linux/rknn_server/aarch64/usr/bin/rknn_server
    runHook postInstall
  '';

  outputs = [ "out" ];

}
