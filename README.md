# dockerfiles

Build images for chiaki-ng projects, published to `ghcr.io/chiaki-ng/<name>` for amd64 and arm64.

Each image is a `Dockerfile.<name>` at the root. Pushing a tag `<name>-<ddmmyy>`, with the name in lower case, builds that image and publishes `ghcr.io/chiaki-ng/<name>:<ddmmyy>` and `:latest`; pin consumers to the dated tag's digest. Pushes and pull requests only build the Dockerfiles they change, and the workflow can be run by hand to build one image without publishing.

| Image | Contents |
| --- | --- |
| `devkita64` | devkitPro's devkitA64 image updated to GCC 16, with libnx, the Switch CMake and pkg-config wrappers, and the host tools native-deps needs |
