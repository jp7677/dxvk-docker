#!/bin/sh
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/nvapi/nvapi.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/nvapi/nvapi64.dll

cp --verbose out/dxvk-nvapi-git/x32/nvapi.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/nvapi/
cp --verbose out/dxvk-nvapi-git/x64/nvapi64.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/nvapi/
