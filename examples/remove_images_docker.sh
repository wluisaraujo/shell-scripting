#!/bin/bash
image_list=$(sudo docker images -q | sort -u)

# not delete during docker build
check_build() { 
sudo ps aux | grep "docker build" | egrep -v "watch|grep" || sudo docker stop $(sudo docker container ps -a -q)
}
# force delete (can’t delete image even with -f flag)
delete_image() { 
sudo docker rmi --force $(sudo docker images -a | egrep -v "IMAGE|<none>" | awk '{print $3}')
}

while [[ -n image_list ]] ; do
    if [[ -n $image_list ]]; then
	check_build
	echo "Removendo imagens do node $(hostname)..."
	delete_image && exit
    else
	echo "Não existem imagens no node $(hostname)..." && exit
fi
done


## be a motherfucker and do
##
## sudo docker system prune --volumes --all --force
##
