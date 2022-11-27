#!/usr/bin/env sh

pacman-key --init
pacman -Sy --config /etc/pacman.conf.unsafe --noconfirm rebornos-keyring 
pacman-key --populate archlinuxarm rebornos
pacman -Sy --noconfirm archlinuxarm-keyring
pacman -Sy --noconfirm

/bin/bash
