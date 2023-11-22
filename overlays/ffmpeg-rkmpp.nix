self: super:

let
  enableFfmpegRkmpp = ffmpeg: ffmpeg.overrideAttrs ({ configureFlags, buildInputs, ... }: {
    buildInputs = buildInputs ++ [ self.rockchip_mpp_101 self.librga self.libdrm self.libyuv ];
    configureFlags = configureFlags ++ [ "--enable-rkmpp" "--enable-libdrm" "--disable-cuvid" "--disable-nvdec" "--disable-nvenc" ];

    # https://forum.radxa.com/t/updated-ffmpeg-with-mpp/17771/16
    src = self.fetchgit {
      url = "https://github.com/hbiyik/FFmpeg.git";
      # encoder
      #rev = "e243e8d0010dfdaab0a9e3f9bb94dba7a2c51c69";
      #sha256 = "+fsUpgKl0kCCrWoYZ2THXAqNJb3jw8Bc22KlNZsoOrU=";
      # exp_refactor_all
      rev = "65d4cf4bd74904dcbcd935685d2160da83f8f72d";
      sha256 = "Q+hroHiIUbCPt6Auayon0HDAE8hUFcRLs3e+AR524uQ=";
    };

    doCheck = false;

    # this forked ffmpeg5.1 includes the broken aacps_tablegen
    patches = (super.patches or []) ++ [
      (self.fetchpatch { # this can be removed post 6.1
        name = "fix_aacps_tablegen";
        url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/814178f92647be2411516bbb82f48532373d2554";
        hash = "sha256-FQV9/PiarPXCm45ldtCsxGHjlrriL8DKpn1LaKJ8owI=";
      })
      # ../patches/ffmpeg_disable_nv15.patch
      ../patches/ffmpeg_fix_nv15_test.patch
    ];
  });
in
{
  # More generally applicable packages
  librga = super.callPackage ../packages/librga.nix {};
  # rockchip_mpp_20170811 = super.callPackage ../packages/rockchip_mpp_20170811.nix {};
  rockchip_mpp_20171218 = super.callPackage ../packages/rockchip_mpp_20171218.nix {};
  rockchip_mpp_101 = super.callPackage ../packages/rockchip_mpp_101.nix {};
  rockchip_mpp_102 = super.callPackage ../packages/rockchip_mpp_102.nix {};

  ffmpeg = enableFfmpegRkmpp super.ffmpeg;
  ffmpeg-full = enableFfmpegRkmpp super.ffmpeg-full;
}
