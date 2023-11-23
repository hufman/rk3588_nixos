self: super: {
  mesa = super.callPackage ../packages/mesa-panfork.nix {mesa=super.mesa;};
}
# {inputs, ...}: {
#   imports = [
#     inputs.flake-parts.flakeModules.easyOverlay
#   ];
#   perSystem = {pkgs, config, ...}: {
#     overlayAttrs = {
#       mesa = pkgs.callPackage ../packages/mesa-panfork.nix {};
#     };
#   };
# }
