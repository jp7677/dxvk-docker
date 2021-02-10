#!/bin/sh

if [ -z "$WINEPREFIX" ]; then 
    echo "WINEPREFIX not set"
    exit 1
fi

set -e

cp --verbose out/dxvk-nvapi-git/x64/nvapi64.dll "$WINEPREFIX/drive_c/windows/system32"
cp --verbose out/dxvk-nvapi-git/x32/nvapi.dll "$WINEPREFIX/drive_c/windows/syswow64"
