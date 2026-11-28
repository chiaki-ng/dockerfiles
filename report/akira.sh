#!/usr/bin/env bash
set -euo pipefail

gcc=$(aarch64-none-elf-gcc -dumpfullversion)
binutils=$(aarch64-none-elf-ld --version | sed -n '1s/.* //p')
cmake=$(cmake --version | sed -n '1s/^cmake version //p')

printf '## Toolchain\n\n'
printf '| | |\n| --- | --- |\n'
printf '| GCC | %s |\n' "$gcc"
printf '| binutils | %s |\n' "$binutils"
printf '| CMake | %s |\n' "$cmake"

printf '\n## Switch SDKs\n\n'
printf '| SDK | Version |\n| --- | --- |\n'
for pkg in libnx libounce ouncevk libkaihen; do
  printf '| %s | %s |\n' "$pkg" "$(dkp-pacman -Q "$pkg" | cut -d' ' -f2)"
done

printf '\n## devkitPro and ounce packages\n\n'
printf '| Package | Version |\n| --- | --- |\n'
dkp-pacman -Q | while read -r name version; do
  printf '| %s | %s |\n' "$name" "$version"
done
