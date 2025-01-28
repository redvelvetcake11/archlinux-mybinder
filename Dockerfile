FROM archlinux:latest

USER root
RUN pacman -Syu --noconfirm
RUN pacman -S sudo python jupyterlab python-pandas python-numpy python-matplotlib --noconfirm
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "jovyan:jovyan" | chpasswd
EXPOSE 8888
