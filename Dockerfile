FROM archlinux:latest

USER root

# Update and install necessary packages
RUN pacman -Syu --noconfirm
RUN pacman -S sudo python jupyter-notebook python-pandas python-numpy python-terminado python-matplotlib systemd --noconfirm

# Create user
RUN useradd -m -u 1000 jovyan
RUN usermod -aG wheel jovyan
RUN echo "jovyan:jovyan" | chpasswd

# Set systemd default target to multi-user (no GUI)
RUN systemctl set-default multi-user.target

# Create the systemd unit for JupyterLab directly using cat <<EOF
RUN cat <<EOF > /etc/systemd/system/jupyterlab.service
[Unit]
Description=Jupyter Notebook
DefaultDependencies=no
Before=sysinit.target

[Service]
Type=simple
PIDFile=/run/jupyter.pid
ExecStart=/usr/bin/python -m jupyter-lab --notebook-dir=/home/jovyan --no-browser --
User=jovyan
Group=jovyan
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Expose JupyterLab port
EXPOSE 8888

# Set systemd as the default command (this will start the container with systemd)
CMD [ "/lib/systemd/systemd" ]
