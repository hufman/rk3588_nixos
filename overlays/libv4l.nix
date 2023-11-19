self: super:

let
  enableV4lMmap = v4l: v4l.overrideAttrs ({ oldAttrs: rec {
    patches = oldAttrs.patches ++ [(self.fetchpatch {
      name = "0001-libv4l2-Support-mmap-to-libv4l-plugin.patch";
      url = "https://raw.githubusercontent.com/JeffyCN/meta-rockchip/release-1.3.0_20200915/recipes-multimedia/v4l2apps/v4l-utils/0001-libv4l2-Support-mmap-to-libv4l-plugin.patch";
      # sha256 = "";
    })];
  });
in

{
  v4l-utils = enableV4lMmap super.v4l-utils;
}
