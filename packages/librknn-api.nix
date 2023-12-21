{ stdenv, lib, fetchgit, autoPatchelfHook }:

stdenv.mkDerivation rec {
  name = "librknn-api";
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
    install -m 555 -D -t $out/lib $src/rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so
    install -m 444 -D -t $out/include $src/rknpu2/runtime/Linux/librknn_api/include/*
  '';

  outputs = [ "out" ];

}
