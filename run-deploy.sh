#!/bin/bash

#IP1=$(getent hosts master01 | awk '{print $1}')
#IP2=$(getent hosts master02 | awk '{print $1}')
#IP3=$(getent hosts master03 | awk '{print $1}')

IP1=35.195.175.232
IP2=34.76.252.233
IP3=35.187.160.144

export IP1 
export IP2 
export IP3 

cd /srv/swarm/swarm-cluster-example

docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c my-wordpress/stack.yml my-wordpress
docker stack deploy -c logspout-elk/stack.yaml logspout-elk
docker stack deploy -c tig-stack/stack.yaml tig
