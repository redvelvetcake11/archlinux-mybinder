FROM archlinux:latest

USER root

# Update and install necessary packages
RUN pacman -Syu --noconfirm
RUN pacman -S sudo python jupyterlab python-pandas python-numpy python-terminado python-matplotlib --noconfirm

# Create user
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "jovyan:jovyan" | chpasswd

# Expose JupyterLab port
EXPOSE 8888
