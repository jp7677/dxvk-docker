#!/bin/bash

rm --force ~/.steam/steam/steamapps/common/Proton\ 5.13/dist/lib64/wine/vkd3d-proton/d3d12.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 5.13/dist/lib/wine/vkd3d-proton/d3d12.dll

cp --verbose out/vkd3d-proton-git/x64/d3d12.dll ~/.steam/steam/steamapps/common/Proton\ 5.13/dist/lib64/wine/vkd3d-proton/
cp --verbose out/vkd3d-proton-git/x86/d3d12.dll ~/.steam/steam/steamapps/common/Proton\ 5.13/dist/lib/wine/vkd3d-proton/
