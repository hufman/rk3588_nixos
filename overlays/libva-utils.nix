self: super:

let
  enableRockchipDriver = old: old.overrideAttrs ( oldAttrs: rec {
    buildInputs = (oldAttrs.buildInputs or []) ++ [ self.libva-rockchip ];
    mesonFlags = (oldAttrs.mesonFlags or []) ++ [
      "-Ddriverdir=${self.libva-rockchip}/lib/dri"
    ];
  });
in

{
  libva-rockchip = super.callPackage ../packages/libva-rockchip.nix {};

  libva = enableRockchipDriver super.libva;
  # libva1 = enableRockchipDriver super.libva1;
}
