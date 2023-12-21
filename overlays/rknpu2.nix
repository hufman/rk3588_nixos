self: super:

{
  rknpu2 = super.callPackage ../packages/rknpu2.nix {};
  librknn-api = super.callPackage ../packages/librknn-api.nix {};
  rknn-toolkit-lite2 = super.callPackage ../packages/rknn-toolkit-lite2.nix {};
}
