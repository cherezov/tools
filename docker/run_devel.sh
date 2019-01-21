docker run -dit --rm --name devel -e USER=$USER -u `id -u`:`id -g` -w `pwd` --mount type=bind,source=$HOME,target=/home/$USER devel
