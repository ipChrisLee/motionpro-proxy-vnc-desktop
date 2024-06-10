FROM dorowu/ubuntu-desktop-lxde-vnc

ARG rootPasswd
EXPOSE 22
EXPOSE 80

RUN mkdir -p /workspace /install

WORKDIR /workspace

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgl1-mesa-glx

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "root:${rootPasswd}" | chpasswd

COPY res/MotionProInstaller.sh /install/MotionProInstaller.sh
RUN chmod +x /install/MotionProInstaller.sh
# RUN /install/MotionProInstaller.sh

# RUN /install/MotionProInstaller.sh

#COPY entrypoint.sh /install/entrypoint.sh

# ENTRYPOINT ["/install/entrypoint.sh"]
