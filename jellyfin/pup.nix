{ pkgs ? import <nixpkgs> {} }:

# Jellyfin media server pup for Dogebox.
# Everything (config, cache, logs, media) lives in the pup's /storage volume
# (on the Dogebox data disk). Web UI: http://<dogebox>:8096
let
  jellyfin = pkgs.jellyfin;

  run = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    mkdir -p /storage/config /storage/cache /storage/log /storage/media
    # NB: nixpkgs' jellyfin wrapper already injects --ffmpeg; do not pass it again.
    exec ${jellyfin}/bin/jellyfin \
      --datadir /storage/config \
      --cachedir /storage/cache \
      --logdir /storage/log
  '';
in
{
  jellyfin = run;
}
