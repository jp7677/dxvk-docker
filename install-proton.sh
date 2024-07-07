#!/bin/bash

if [ -e ~/.steam/steam/steamapps/common/Proton\ -\ Experimental ]; then

    if [ -e out/dxvk-git ]; then
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/dxgi.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d8.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d9.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d10core.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/d3d11dll

        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/dxgi.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d8.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d9.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d10core.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/d3d11.dll

        cp --verbose out/dxvk-git/x64/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
        cp --verbose out/dxvk-git/x64/d3d8.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
        cp --verbose out/dxvk-git/x64/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
        cp --verbose out/dxvk-git/x64/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
        cp --verbose out/dxvk-git/x64/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/

        cp --verbose out/dxvk-git/x32/dxgi.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
        cp --verbose out/dxvk-git/x32/d3d8.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
        cp --verbose out/dxvk-git/x32/d3d9.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
        cp --verbose out/dxvk-git/x32/d3d10core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
        cp --verbose out/dxvk-git/x32/d3d11.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/
    fi

    if [ -e out/dxvk-nvapi-git ]; then
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/nvapi/nvapi64.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/nvapi/nvapi.dll

        cp --verbose out/dxvk-nvapi-git/x64/nvapi64.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/nvapi/
        cp --verbose out/dxvk-nvapi-git/x32/nvapi.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/nvapi/
    fi

    if [ -e out/vkd3d-proton-git ]; then
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/vkd3d-proton/d3d12core.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/vkd3d-proton/d3d12.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/d3d12core.dll
        rm --force ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/d3d12.dll

        cp --verbose out/vkd3d-proton-git/x64/d3d12core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/vkd3d-proton/
        cp --verbose out/vkd3d-proton-git/x64/d3d12.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/vkd3d-proton/
        cp --verbose out/vkd3d-proton-git/x86/d3d12core.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/
        cp --verbose out/vkd3d-proton-git/x86/d3d12.dll ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/
    fi
fi
