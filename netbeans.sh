#based on https://github.com/fgrehm/docker-netbeans
VERSION=8.0.1
DISPLAY=:0
TOOL=netbeans
TOOLPATH=/tmp/docker-netbeans.$$
echo "Starting $TOOL:$VERSION on display $DISPLAY"
mkdir $TOOLPATH
PATH=$PATH:$TOOLPATH
docker pull fgrehm/netbeans:v$VERSION
L=$TOOLPATH/$TOOL && curl -sL https://github.com/fgrehm/docker-netbeans/raw/master/netbeans > $L && chmod +x $L
docker run -ti --rm -e DISPLAY=$DISPLAY   -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v `pwd`/.netbeans-docker:/home/developer/.netbeans  -v `pwd`:/workspace fgrehm/netbeans:v$VERSION
containerId=`docker ps -l -q`
containerHostname=`docker inspect --format='{{ .Config.Hostname }}' $containerId`
echo "  containerId : $containerId"
echo "  containerHostname $containerHostname"
xhost +local:$containerHostname
docker start $containerId
echo "Container $containerId stopped/exited"
docker logs $containerId
echo "Cleanup: "
echo "   - XHOST"`xhost -local:$containerHostname`
ls -la $TOOLPATH
echo "   - TOOLPATH: "`/bin/rm -rf $TOOLPATH `
#http://wiki.ros.org/docker/Tutorials/GUI
echo "Done."
