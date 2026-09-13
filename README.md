# Jellyfin — Dogebox pup

[Jellyfin](https://jellyfin.org), the Free Software Media System, packaged as a Dogebox pup. No accounts, no cloud, no subscriptions — your media stays on your box.

- **Web UI:** `http://<dogebox-ip>:8096` (also launchable from the Dogebox dashboard)
- **Package:** nixpkgs `pkgs.jellyfin` + `pkgs.ffmpeg`
- **Storage layout** (pup `/storage` volume, on the Dogebox data disk):
  - `/storage/config` — Jellyfin server config + metadata
  - `/storage/cache` — transcode cache
  - `/storage/log` — logs
  - `/storage/media` — **your media library** (create subfolders: `movies/`, `shows/`, `music/`)

## Adding media

Copy files into the pup's storage `media/` dir on the box (path visible in the pup management screen), e.g.:

```bash
scp -r ~/Movies/*.mkv shibe@dogebox:/opt/dogebox/pups/storage/<pup-hash>/media/movies/
```

## Notes

- RK3588 (NanoPC-T6): plan for **direct play**; hardware transcode on mainline Linux is still maturing. 1–2 CPU-transcoded 1080p streams are fine.
- First Jellyfin start takes a moment; then complete the setup wizard in the web UI.
- Dev-tier, Dogebox OS beta. Test pup — not upstreamed yet.

## Install (as a Pup Source)

Dashboard → Pup Store → Manage Sources → add this repo URL → install "Jellyfin".
