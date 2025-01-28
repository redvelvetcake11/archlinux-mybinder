FROM archlinux:latest

USER root
RUN pacman -Syu --noconfirm
RUN pacman -S sudo --noconfirm
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "jovyan:jovyan" | chpasswd
