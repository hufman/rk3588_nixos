{ pkgs, config, lib, ... }:

let
  rknpu2cfg = config.services.rknpu2;
in {

  options.services.rknpu2.enable = lib.mkOption {
    # Make sure that this option type conflicts with the one in
    # the original NixOS module for illustration purposes.
    type = lib.types.bool;
    default = false;
    description = "Run rknpu2 TPU service";
  };

  config = lib.mkIf config.services.rknpu2.enable {
    systemd.services.rknpu2 = {
      description = "Rockchip rknpu2 TPU service";
      wantedBy = [ "multi-user.target" ];
      serviceConfig.ExecStart = "${pkgs.rockchip-rknpu2}/bin/rknn_server";
    };
  };
}
