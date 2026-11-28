# dockerfiles

Build images for chiaki-ng projects, published to `ghcr.io/chiaki-ng/<name>` for amd64 and arm64.

Each image is a `Dockerfile.<name>` at the root, and only its own release builds it. A layered image, whose `Dockerfile.<name>` starts with `ARG BASE=ghcr.io/chiaki-ng/<base>@…`, has no release of its own and comes out in its base's release instead.

Publishing a release tagged `<name>-<ddmmyy>` on `main` builds that one Dockerfile. `<name>` must match the file name exactly, so `Dockerfile.devkitA64` is released as `devkitA64-221026`. The image is published as `ghcr.io/chiaki-ng/<name in lower case>:<ddmmyy>` and `:latest`, for amd64 and arm64.

A release first publishes its own image, then builds every image layered on it from that new digest and publishes them under the same `<ddmmyy>`. A `devkitA64-<ddmmyy>` release therefore publishes both `devkita64` and `ounce`. The `BASE` pinned in a layered Dockerfile is only used for local builds and for runs by hand.

The release notes record each image's digest, and consumers should pin to it. When `report/<name>.sh` exists, its output is added to the notes. It runs inside the published image; for `devkitA64` it lists the GCC and libnx versions and every devkitPro package.

Branch pushes, tags without a release and pull requests build nothing. The workflow can also be run by hand to build one image without publishing it.

| Image | Contents |
| --- | --- |
| `devkita64` | devkitPro's devkitA64 image updated to GCC 16, with libnx, the Switch CMake and pkg-config wrappers, and the host tools native-deps needs |
| `ounce` | `devkita64` with ouncebrew's Switch 2 SDK beside libnx: libounce, ouncevk and libkaihen from `pkg.ouncebrew.org`, drako3d built into libounce, and uam2, drakotools and glslang on the path |
