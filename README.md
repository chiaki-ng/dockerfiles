# dockerfiles

Build images for chiaki-ng projects, published to `ghcr.io/chiaki-ng/<name>` for amd64 and arm64.

Each image is a `Dockerfile.<name>` at the root, and only its own release builds it. Publishing a release tagged `<name>-<ddmmyy>` on `main`, with `<name>` exactly as in the file name (`devkitA64-221026` for `Dockerfile.devkitA64`), builds that one Dockerfile, publishes `ghcr.io/chiaki-ng/<name in lower case>:<ddmmyy>` and `:latest`, and writes the digest into the release notes; pin consumers to that digest. When `report/<name>.sh` exists, the release notes also carry its output, run inside the published image (for `devkitA64`, the GCC and libnx versions and every devkitPro package). Branch pushes, tags without a release and pull requests build nothing. The workflow can be run by hand to build one image without publishing.

| Image | Contents |
| --- | --- |
| `devkita64` | devkitPro's devkitA64 image updated to GCC 16, with libnx, the Switch CMake and pkg-config wrappers, and the host tools native-deps needs |
