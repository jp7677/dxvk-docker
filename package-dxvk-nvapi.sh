#!/bin/bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

pushd dxvk-nvapi
VERSION=$(git describe --always --tags --dirty=+)
popd

pushd out/dxvk-nvapi-git
tar -zcvf "../dxvk-nvapi-$VERSION.tar.gz" *
popd
