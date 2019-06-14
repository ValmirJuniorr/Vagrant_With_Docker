#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo " starting installation docker ....."

apt-get remove docker docker-engine docker.io containerd runc
 
apt-get update
 
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io

echo " Installation docker done"

echo " Installing docker-compose..."

curl -L https://github.com/docker/compose/releases/download/1.25.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

 echo " Installation docker-compose done"

#Run this line after provisioning
#usermod -aG docker ${USER}
