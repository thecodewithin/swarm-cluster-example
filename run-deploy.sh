#!/bin/bash

IP1=$(getent hosts master01 | awk '{print $1}')
IP2=$(getent hosts master02 | awk '{print $1}')
IP3=$(getent hosts master03 | awk '{print $1}')

export IP1 IP2 IP3

cd /srv/swarm/swarm-cluster-example

docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c my-wordpress/stack.yml my-wordpress
