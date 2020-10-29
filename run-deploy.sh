#!/bin/bash

#IP1=$(getent hosts master01 | awk '{print $1}')
#IP2=$(getent hosts master02 | awk '{print $1}')
#IP3=$(getent hosts master03 | awk '{print $1}')

IP1=104.199.32.151
IP2=34.77.29.102
IP3=34.78.220.147

export IP1 
export IP2 
export IP3 

cd /srv/swarm/swarm-cluster-example

docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c my-wordpress/stack.yml my-wordpress
docker stack deploy -c logspout-elk/stack.yaml logspout-elk
docker stack deploy -c tig-stack/stack.yaml tig
