{ stdenv, fetchFromGitHub, pkgs }:

stdenv.mkDerivation {
  name = "librga";
  version = "20201124";

  src = fetchFromGitHub {
    owner = "tsukumijima";
    repo = "librga-rockchip";
    rev = "f8c78f8a6659eacf9637635c9e5eb94a76388699";
    sha256 = "w0UdLABBX+7H5LDnHan1NA0GMsuD9v6dK4Z9G2f8NlM=";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.meson pkgs.ninja ];
  buildInputs = [ pkgs.libdrm ];

  outputs = [ "dev" "out" ];
}
