#!/bin/bash
rm -Rf out/* && docker run -e UID=$UID -e GID=$(id -g $USER) -it -v $(pwd)/dxvk-nvapi:/root/build -v $(pwd)/out:/root/build/out dxvk-docker:latest

