# based on https://docs.docker.com/engine/installation/ubuntulinux/
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo sudo apt-get update
sudo sudo apt-get upgrade
sudo apt-get purge lxc-docker
sudo apt-get install -y linux-image-extra-$(uname -r)
echo "Perform default check:"
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh | /bin/bash /dev/stdin
echo "Verify Repro:"
apt-cache policy docker-engine
#sudo apt-get install -y 
sudo apt-get install -y docker-engine
sudo service docker start
#based on http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo
sudo groupadd docker
#Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user:
sudo gpasswd -a ${USER} docker
newgrp docker
#Restart the Docker daemon:
sudo service docker restart
docker run hello-world
