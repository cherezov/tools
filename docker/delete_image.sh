#! /bin/sh
# delete_image.sh <image_id>
docker image rm $(docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=$1 -q));
