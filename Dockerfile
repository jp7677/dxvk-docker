FROM archlinux/base:latest

RUN echo -e '[froggies]\nServer = https://repo.froggi.es/$arch\nSigLevel = Never' >> /etc/pacman.conf
RUN pacman --noconfirm -Syuu
RUN pacman --noconfirm -S git gcc mingw-w64-gcc meson ninja glslang

WORKDIR /root/build
RUN mkdir -p /root/out/dxvk-master
ADD build.sh /root/build.sh
CMD ["/root/build.sh"]
