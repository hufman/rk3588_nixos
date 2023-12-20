{
  self,
  inputs,
  ...
}: {
  imports = [ 
   ./ffmpeg-rkmpp.nix
   ./gst-rockchip.nix
   ./mesa-panfork.nix
   # ./v4l.nix  # breaks xdg-desktop-portal in nixos-23.11, for some reason
                # and is needed for Chromium with patches, which I haven't set up yet
   ./rknpu2.nix
  ];
}
