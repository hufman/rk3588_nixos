Nix for RK3588
==============

Instead of waiting for all of the RK3588 hardware to be supported in mainline,
this Nix module attempts to overlay the main NixPkgs repo with Rockchip-specific patches.
Most Nixos on Rockchip repos focus on building images for the systems,
but this repo just focuses on userspace.

Examples are copied from:
 - https://github.com/thefloweringash/rock64-nix # FFmpeg patching
 - https://github.com/aciceri/rock5b-nixos # Mesa-Panfork package
 - https://github.com/ryan4yin/nixos-rk3588
