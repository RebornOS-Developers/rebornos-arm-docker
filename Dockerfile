FROM --platform=linux/arm64 menci/archlinuxarm:base-devel

WORKDIR /home/rebornos-arm-shared
ENV LANG=C.UTF-8
SHELL ["/bin/sh", "-c"]

COPY etc/ /etc/
COPY usr/ /usr/
RUN pacman-key --init \
    && pacman -Sy --noconfirm archlinuxarm-keyring \
    && pacman -Sy --config /etc/pacman.conf.unsafe --noconfirm rebornos-keyring \
    && pacman-key --populate archlinuxarm rebornos \
    && pacman -Syu --noconfirm rebornos-mirrorlist rebornos-os-release rebornos-logo rate-mirrors \
    && rm -rf \
        /etc/pacman.d/gnupg \
        /var/cache/pacman/pkg/ \
        /var/lib/pacman/sync/

CMD ["/usr/bin/init-rebornos-arm-docker.sh"]

