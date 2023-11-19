self: super:

let
  enableFfmpegRkmpp = ffmpeg: ffmpeg.overrideAttrs ({ configureFlags, buildInputs, ... }: {
    buildInputs = buildInputs ++ [ self.rockchip_mpp_101 self.libdrm ];
    configureFlags = configureFlags ++ [ "--enable-rkmpp" "--enable-libdrm" ];
  });
in

{
  # More generally applicable packages
  # rockchip_mpp_20170811 = super.callPackage ../packages/rockchip_mpp_20170811.nix {};
  rockchip_mpp_20171218 = super.callPackage ../packages/rockchip_mpp_20171218.nix {};
  rockchip_mpp_101 = super.callPackage ../packages/rockchip_mpp_101.nix {};
  rockchip_mpp_102 = super.callPackage ../packages/rockchip_mpp_102.nix {};

  ffmpeg = enableFfmpegRkmpp super.ffmpeg;
  ffmpeg-full = enableFfmpegRkmpp super.ffmpeg-full;
}
