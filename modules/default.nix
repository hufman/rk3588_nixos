{
  self,
  inputs,
  ...
}: {
  imports = [ 
   ./ffmpeg-rkmpp.nix
   ./gst-rockchip.nix
   ./mesa-panfork.nix
   ./v4l.nix
  ];
}
