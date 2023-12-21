{ python3Packages, stdenv, lib, fetchgit, autoPatchelfHook }:

python3Packages.buildPythonPackage rec {
  name = "rknn-toolkit-lite2";
  version = "1.6.0";

  src = fetchgit {
    url = "https://github.com/airockchip/rknn-toolkit2.git";
    rev = "v${version}";
    sha256 = "9FLWQPj7uzVbOJOtZFXjJ+tCGM1mkZxhnSCE7XyB17k=";
    sparseCheckout = [
      "rknn_toolkit_lite2/packages"
    ];
  } + "/rknn_toolkit_lite2/packages/rknn_toolkit_lite2-${version}-cp311-cp311-linux_aarch64.whl";

  format = "wheel";

}
