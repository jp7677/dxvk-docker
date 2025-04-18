#!/bin/sh
FILTER="$1"
if [ -z "$1" ]; then
  FILTER="[@all]"
fi

DXVK_ENABLE_NVAPI=1 \
DXVK_LOG_LEVEL=none \
DXVK_HDR=1 \
DXVK_NVAPI_LOG_LEVEL=none \
DXVK_NVAPI_ALLOW_OTHER_DRIVERS=1 \
DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS=DLSSIndicator=0,DLSSGIndicator=0,Logging=0,LogLevel=0 \
WINEDEBUG=-all \
WINEDLLOVERRIDES=nvapi64=n \
WINEDLLPATH=$(realpath ../../Wine/nvidia-libs/) \
WINEPATH=$(realpath ../../Wine/nvidia-libs/) \
wine out/dxvk-nvapi-git/x64/nvapi64-tests.exe "$FILTER"

DXVK_NVAPI_LOG_LEVEL=none \
WINEDEBUG=-all \
WINEDLLOVERRIDES=nvofapi64=n \
wine out/dxvk-nvapi-git/x64/nvofapi64-tests.exe "$FILTER"
