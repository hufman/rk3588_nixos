{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./../overlays/mesa-panfork.nix)
  ];
}
