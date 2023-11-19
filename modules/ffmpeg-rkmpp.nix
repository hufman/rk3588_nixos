# Warning: rebuilds a ton of dependencies
# https://github.com/thefloweringash/rock64-nix/blob/master/overlays/ffmpeg-rkmpp.nix
{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [ (import ./../overlays/ffmpeg-rkmpp.nix) ];

  environment.systemPackages = [ pkgs.ffmpeg-full ];
}
