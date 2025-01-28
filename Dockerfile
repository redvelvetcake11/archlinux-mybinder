FROM archlinux:latest

USER root
RUN pacman -Syu --noconfirm && pacman -S sudo --noconfirm
