#!/bin/bash

rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/dxgi.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/d3d11.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/d3d10core.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/d3d9.dll

rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/dxgi.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/d3d11.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/d3d10core.dll
rm --force ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/d3d9.dll

cp --verbose out/dxvk-git/x64/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/
cp --verbose out/dxvk-git/x64/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/
cp --verbose out/dxvk-git/x64/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/
cp --verbose out/dxvk-git/x64/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib64/wine/dxvk/

cp --verbose out/dxvk-git/x32/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/
cp --verbose out/dxvk-git/x32/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/
cp --verbose out/dxvk-git/x32/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/
cp --verbose out/dxvk-git/x32/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ 7.0/dist/lib/wine/dxvk/

if [ -e ~/.steam/steam/steamapps/common/Proton\ -\ Experimental ]; then
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/dxgi.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d11.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d10core.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d9.dll

    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/dxgi.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d11.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d10core.dll
    rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d9.dll

    cp --verbose out/dxvk-git/x64/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
    cp --verbose out/dxvk-git/x64/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
    cp --verbose out/dxvk-git/x64/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
    cp --verbose out/dxvk-git/x64/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/

    cp --verbose out/dxvk-git/x32/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
    cp --verbose out/dxvk-git/x32/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
    cp --verbose out/dxvk-git/x32/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
    cp --verbose out/dxvk-git/x32/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
fi
