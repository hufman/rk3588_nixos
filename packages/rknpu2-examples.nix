{ stdenv, lib, pkgs, fetchgit, autoPatchelfHook, cmake, gcc }:

stdenv.mkDerivation rec {
  name = "rknpu2-examples";
  version = "1.6.0";

  src = fetchgit {
    url = "https://github.com/airockchip/rknn-toolkit2.git";
    rev = "v${version}";
    sha256 = "BrTuK9+E0gQSo8IqTy8xsokHJ6pb1els2ljJDCiA1zI=";
    sparseCheckout = [
      "rknpu2/examples"
      "rknpu2/runtime"
    ];
  };

  nativeBuildInputs = [
    autoPatchelfHook
    cmake
    (pkgs.callPackage ./librknn-api.nix {})
    (pkgs.writeShellScriptBin "aarch64-linux-gnu-gcc" ''
    ${gcc}/bin/gcc "$@"
    '')
    (pkgs.writeShellScriptBin "aarch64-linux-gnu-g++" ''
    ${gcc}/bin/g++ "$@"
    '')
  ];
  buildInputs = [
    (pkgs.callPackage ./librknn-api.nix {})
    pkgs.opencv
  ];

  patches = [
    ./rknpu2-examples-rknn_mobilenet_demo.patch
  ];

  configurePhase = ''
    cd rknpu2/examples
    cd rknn_mobilenet_demo
    mkdir build
    cd build
    cmake ../ -DTARGET_SOC=RK3588 -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ \
              -DRKNN_API_PATH=${pkgs.callPackage ./librknn-api.nix {}} -DOpenCV_DIR=${pkgs.opencv}/lib/cmake/opencv4
    cd ../..
  '';
  buildPhase = ''
    cd rknn_mobilenet_demo/build
    make -j4
    cd ../..
  '';

  installPhase = ''
    runHook preInstall
    install -m 755 -D -t $out/bin rknn_mobilenet_demo/build/rknn_mobilenet_demo
    install -m 444 -D -t $out/share/rknn_mobilenet_demo rknn_mobilenet_demo/model/*jpg
    install -m 444 -D -t $out/share/rknn_mobilenet_demo rknn_mobilenet_demo/model/RK3588/mobilenet_v1.rknn
    runHook postInstall
  '';

  outputs = [ "out" ];

}
