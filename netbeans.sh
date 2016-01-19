#based on https://github.com/fgrehm/docker-netbeans
VERSION=8.0.1
DISPLAY=:0
TOOL=netbeans
echo $PATH
local tmpPath=$PATH
TOOLPATH=/tmp/docker-netbeans.$$
mkdir $TOOLPATH
PATH=$PATH:$TOOLPATH
echo $PATH
docker pull fgrehm/netbeans:v$VERSION
L=$TOOLPATH/$TOOL && curl -sL https://github.com/fgrehm/docker-netbeans/raw/master/netbeans > $L && chmod +x $L
docker run -ti --rm -e DISPLAY=$DISPLAY   -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`/.netbeans-docker:/home/developer/.netbeans  -v `pwd`:/workspace fgrehm/netbeans:v$VERSION
PATH=$tmpPath
rm -rf $TOOLPATH
echo $PATH
