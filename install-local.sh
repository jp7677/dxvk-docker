#!/usr/bin/env bash

# default directories
dxvk_lib32="x32"
dxvk_lib64="x64"

# figure out where we are
basedir="$(dirname "$(readlink -f "$0")")"

file_cmd="cp -v --reflink=auto"

# check wine prefix before invoking wine, so that we
# don't accidentally create one if the user screws up
if [ -n "$WINEPREFIX" ] && ! [ -f "$WINEPREFIX/system.reg" ]; then
  echo "$WINEPREFIX:"' Not a valid wine prefix.' >&2
  exit 1
fi

# find wine executable
export WINEDEBUG=-all
# disable mscoree and mshtml to avoid downloading
# wine gecko and mono
export WINEDLLOVERRIDES="mscoree,mshtml="

wine="wine"
wine64="wine64"
wineboot="wineboot"

# $PATH is the way for user to control where wine is located (including custom Wine versions).
# Pure 64-bit Wine (non Wow64) requries skipping 32-bit steps.
# In such case, wine64 and winebooot will be present, but wine binary will be missing,
# however it can be present in other PATHs, so it shouldn't be used, to avoid versions mixing.
wine_path=$(dirname "$(which $wineboot)")
wow64=true
if ! [ -f "$wine_path/$wine" ]; then
   wine=$wine64
   wow64=false
fi

# resolve 32-bit and 64-bit system32 path
winever=$($wine --version | grep wine)
if [ -z "$winever" ]; then
    echo "$wine:"' Not a wine executable. Check your $wine.' >&2
    exit 1
fi

# ensure wine placeholder dlls are recreated
# if they are missing
$wineboot -u

win64_sys_path=$($wine64 winepath -u 'C:\windows\system32' 2> /dev/null)
win64_sys_path="${win64_sys_path/$'\r'/}"
if $wow64; then
  win32_sys_path=$($wine winepath -u 'C:\windows\system32' 2> /dev/null)
  win32_sys_path="${win32_sys_path/$'\r'/}"
fi

if [ -z "$win32_sys_path" ] && [ -z "$win64_sys_path" ]; then
  echo 'Failed to resolve C:\windows\system32.' >&2
  exit 1
fi

# create native dll override
overrideDll() {
  $wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v $1 /d native /f >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo -e "Failed to add override for $1"
    exit 1
  fi
}

# copy or link dxvk dll, back up original file
installFile() {
  dstfile="${1}/${3}.dll"
  srcfile="${basedir}/${2}/${3}.dll"

  if ! [ -f "${srcfile}" ]; then
    dstfile="${1}/${3//64/}.dll"
    srcfile="${basedir}/${2}/${3//64/}.dll"
  fi

  if ! [ -f "${srcfile}" ]; then
    echo "${srcfile}: File not found. Skipping." >&2
    return 1
  fi

  if [ -n "$1" ]; then
    if [ -f "${dstfile}" ] || [ -h "${dstfile}" ]; then
      if ! [ -f "${dstfile}.old" ]; then
        mv -v "${dstfile}" "${dstfile}.old"
      else
        rm -v "${dstfile}"
      fi
    else
      echo "${dstfile}: File not found in wine prefix, copying anyway" >&2
    fi
    $file_cmd "${srcfile}" "${dstfile}"
  fi
  return 0
}

install() {
  installFile "$win64_sys_path" "$2/$dxvk_lib64" "$1"
  inst64_ret="$?"

  inst32_ret=-1
  if $wow64; then
    installFile "$win32_sys_path" "$2/$dxvk_lib32" "$1"
    inst32_ret="$?"
  fi

  if (( ($inst32_ret == 0) || ($inst64_ret == 0) )); then
    overrideDll "$1"
    alt="${1//64/}"
    overrideDll "$alt"
  fi
}

install dxgi out/dxvk-git
install d3d9 out/dxvk-git
install d3d10core out/dxvk-git
install d3d11 out/dxvk-git

install nvapi64 out/dxvk-nvapi-git

dxvk_lib32="x86"
install d3d12 out/vkd3d-proton-git
