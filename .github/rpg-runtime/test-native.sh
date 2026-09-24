#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
cd "$root"
make -j4 platform=unix >/dev/null
test -s theodore_libretro.so
nm -D theodore_libretro.so | grep -q ' retro_serialize$'
nm -D theodore_libretro.so | grep -q ' retro_unserialize$'
