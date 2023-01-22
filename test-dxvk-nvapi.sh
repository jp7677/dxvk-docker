#!/bin/sh
FILTER="$1"
if [ -z "$1" ]; then
  FILTER="[@all]"
fi

DXVK_LOG_LEVEL=none \
DXVK_NVAPI_LOG_LEVEL=none \
WINEDEBUG=-all \
WINEDLLOVERRIDES=nvapi64=n \
WINEDLLPATH=$(realpath ../../Wine/nvidia-libs/) \
WINEPATH=$(realpath ../../Wine/nvidia-libs/) \
wine out/dxvk-nvapi-git/x64/nvapi64-tests.exe "$FILTER"
