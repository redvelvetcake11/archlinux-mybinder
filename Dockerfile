FROM archlinux:latest

USER root
RUN echo -e '\n[archlinuxcn]\nServer = https://repo.archlinuxcn.org/$arch' | sudo tee -a /etc/pacman.conf > /dev/null
RUN pacman -Syu --noconfirm
RUN pacman -S sudo python jupyter-notebook python-pandas python-numpy python-terminado python-matplotlib --noconfirm
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "jovyan:jovyan" | chpasswd
EXPOSE 8888
