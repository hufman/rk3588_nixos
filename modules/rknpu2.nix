# https://github.com/thefloweringash/rock64-nix/blob/master/overlays/ffmpeg-rkmpp.nix
{ config, lib, pkgs, ... }:

{
  imports = [ ./../services/rknpu2.nix ];
  nixpkgs.overlays = [
    (import ./../overlays/rknpu2.nix)
  ];
}
