#based on https://github.com/fgrehm/docker-netbeans
docker pull fgrehm/netbeans:v8.0.1
docker run -ti --rm            -e DISPLAY=$DISPLAY   -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`/.netbeans-docker:/home/developer/.netbeans  -v `pwd`:/workspace fgrehm/netbeans:v8.0.1
