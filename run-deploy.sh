#!/bin/bash

IP1=$(getent hosts instance-1 | awk '{print $1}')
IP2=$(getent hosts instance-2 | awk '{print $1}')
IP3=$(getent hosts instance-3 | awk '{print $1}')

export IP1 IP2 IP3

cd /srv/swarm/swarm-cluster-example

docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c my-wordpress/stack.yaml my-wordpress
