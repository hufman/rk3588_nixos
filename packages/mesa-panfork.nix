# https://github.com/aciceri/rock5b-nixos/blob/master/packages/panfork/default.nix
{
  fetchgit,
  ...
}:
let
  pkgs_2305 = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/release-23.05.tar.gz){};
in
(pkgs_2305.mesa.override {
  enableOSMesa = false;
  vulkanDrivers = [];
  vulkanLayers = [];
  galliumDrivers = ["panfrost"];
})
.overrideAttrs (old: {
  src = fetchgit {
    url = "https://gitlab.com/panfork/mesa.git";
    rev = "120202c675749c5ef81ae4c8cdc30019b4de08f4";
    sha256 = "4eZHMiYS+sRDHNBtLZTA8ELZnLns7yT3USU5YQswxQ0=";
  };
    
  name = "mesa-panfork";
  mesonFlags = old.mesonFlags ++ ["-Dllvm=disabled"];
})
