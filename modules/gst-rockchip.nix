# https://github.com/thefloweringash/rock64-nix/blob/master/overlays/ffmpeg-rkmpp.nix
{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./../overlays/gst-rockchip.nix)
  ];
}
