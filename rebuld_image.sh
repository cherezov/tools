#! /bin/sh
docker rmi $1 && docker build -f $2 -t $1 .
