# https://github.com/thefloweringash/rock64-nix/blob/master/overlays/ffmpeg-rkmpp.nix
{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./../overlays/libv4l.nix)
    (import ./../overlays/libva-utils.nix)
  ];
}
