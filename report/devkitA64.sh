#!/usr/bin/env bash
set -euo pipefail

gcc=$(aarch64-none-elf-gcc -dumpfullversion)
libnx=$(dkp-pacman -Q libnx | cut -d' ' -f2)
binutils=$(aarch64-none-elf-ld --version | sed -n '1s/.* //p')
cmake=$(cmake --version | sed -n '1s/^cmake version //p')

printf '## Toolchain\n\n'
printf '| | |\n| --- | --- |\n'
printf '| GCC | %s |\n' "$gcc"
printf '| libnx | %s |\n' "$libnx"
printf '| binutils | %s |\n' "$binutils"
printf '| CMake | %s |\n' "$cmake"

printf '\n## devkitPro packages\n\n'
printf '| Package | Version |\n| --- | --- |\n'
dkp-pacman -Q | while read -r name version; do
  printf '| %s | %s |\n' "$name" "$version"
done
