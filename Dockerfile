FROM archlinux:base

RUN pacman -Syu --needed --noconfirm git gcc mingw-w64-gcc meson ninja glslang

RUN curl -L https://archlinux.org/packages/multilib/x86_64/wine/download/ -o wine-latest.pkg.tar.zst && \
    tar -I unzstd -xvf wine-latest.pkg.tar.zst usr/bin/widl && \
    rm wine-latest.pkg.tar.zst

WORKDIR /root/build
ADD build.sh /root/build.sh
CMD [ "/root/build.sh" ]
