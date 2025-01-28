FROM archlinux:latest

USER root

RUN echo -e "\n[jlk]\nServer = https://jlk.fjfi.cvut.cz/arch/repo\nSigLevel = Never" | tee -a /etc/pacman.conf > /dev/null

# Update and install necessary packages
RUN pacman -Syu --noconfirm
RUN pacman -S sudo python jupyterhub python-pip python-pandas python-numpy python-terminado python-matplotlib --noconfirm
RUN pip install jupyterlab --break-system-packages

# Create user
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "root:root" | chpasswd
RUN echo "jovyan:jovyan" | chpasswd

# Expose JupyterLab port
EXPOSE 8888
