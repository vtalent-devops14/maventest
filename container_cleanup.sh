#!/bin/bash
###stop and delete the containers which is more 1 day
function container_clean() {
    docker ps |grep -v "k8"|grep min|awk '{print $1}' > /tmp/dockerstop
    echo "below listed containers that will be stopped"
    echo "--------------------------------------------"
    docker_container="/tmp/dockerstop"
        while IFS= read -r line
        do
        echo "$line"
        done < "$docker_container"

    ######stop the selected containers

  #p          while IFS= read -r line
  #p          do
  #p              docker stop $line
  #p          done < "$docker_container"    

  #p  docker container prune --force --filter "until=1d"
}
### clean up the unsued networks

function clean_network() {
    docker network prune --force
}

container_clean
#pclean_network