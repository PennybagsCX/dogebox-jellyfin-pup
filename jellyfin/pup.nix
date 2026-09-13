{ pkgs ? import <nixpkgs> {} }:

# Jellyfin media server pup for Dogebox.
# Everything (config, cache, logs, media) lives in the pup's /storage volume
# (on the Dogebox data disk). Web UI: http://<dogebox>:8096
let
  jellyfin = pkgs.jellyfin;
  ffmpeg = pkgs.ffmpeg;

  run = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    mkdir -p /storage/config /storage/cache /storage/log /storage/media
    exec ${jellyfin}/bin/jellyfin \
      --datadir /storage/config \
      --cachedir /storage/cache \
      --logdir /storage/log \
      --ffmpeg ${ffmpeg}/bin/ffmpeg
  '';
in
{
  jellyfin = run;
}
