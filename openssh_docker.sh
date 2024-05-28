#!/bin/bash

# Update the system
echo "Creating docker openssh server"

docker run -d \
  --name=openssh-server \
  --hostname=your_hostname \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e PUBLIC_KEY_FILE=/home/username/.sshk/id_rsa.pub \
  -e PUBLIC_KEY_DIR=/home/username/.sshk \
  -e SUDO_ACCESS=false \
  -e PASSWORD_ACCESS=false \
  -e USER_PASSWORD=password \
  -e USER_NAME=username \
  -p 2222:2222 \
  -v /home/username/.sshc/sshd_config \
  --restart unless-stopped \
  lscr.io/linuxserver/openssh-server:latest

echo "Server created"
