# based on https://docs.docker.com/engine/installation/ubuntulinux/
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get upgrade
apt-get purge lxc-docker
apt-get install linux-image-extra-$(uname -r)
echo "Perform default check:"
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh | /bin/bash /dev/stdin
echo "Verify Repro:"
apt-cache policy docker-engine
#sudo apt-get install -y 
apt-get install docker-engine
service docker start
docker run hello-world
