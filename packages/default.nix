# Test builds with nix-build
{ pkgs ? import <nixpkgs> {} }:
#pkgs.callPackage ./librga.nix {}
pkgs.callPackage ./libv4l-rkmpp.nix {}
