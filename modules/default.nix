{
  self,
  inputs,
  ...
}: {
  imports = [ 
   ./ffmpeg-rkmpp.nix
   ./mesa-panfork.nix
   ./v4l.nix
  ];
}
