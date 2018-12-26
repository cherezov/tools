docker run -dit --rm --name devel -u `id -u`:`id -g` -w `pwd` --mount type=bind,source=$HOME,target=$HOME $@ devel
