FROM archlinux:base-devel

RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syu --needed --noconfirm git gcc mingw-w64-gcc meson ninja glslang

RUN useradd -m pkg && \
    echo "pkg ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/build

USER pkg
WORKDIR --chown=pkg:pkg /tmp/mingw-w64-tools
RUN git clone https://aur.archlinux.org/mingw-w64-tools.git . && \
    makepkg --noconfirm --syncdeps --rmdeps --install --clean --skippgpcheck

USER root
WORKDIR /root/build
ADD build.sh /root/build.sh
CMD [ "/root/build.sh" ]
