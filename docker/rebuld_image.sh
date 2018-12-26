#! /bin/sh
# ./rebuil_image.sh <image_name> <docker_file>
docker rmi $1 ; docker build -f $2 -t $1 .
