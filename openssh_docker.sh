#!/bin/bash

# Update the system
echo "Creating docker openssh server"

docker run -d \
  --name=openssh-server \
  --hostname=paulgrey-omen \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e PUBLIC_KEY_FILE=/home/paulgrey/.sshk/id_rsa.pub \
  -e PUBLIC_KEY_DIR=/home/paulgrey/.sshk \
  -e SUDO_ACCESS=false \
  -e PASSWORD_ACCESS=false \
  -e USER_PASSWORD=Notnewtothegame89! \
  -e USER_NAME=paulgrey \
  -p 2222:2222 \
  -v /home/paulgrey/.sshc/sshd_config \
  --restart unless-stopped \
  lscr.io/linuxserver/openssh-server:latest

echo "Server created"
