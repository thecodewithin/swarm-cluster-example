apt install -y git bash-completion
curl https://get.docker.com | sudo bash

echo "vm.max_map_count=262144" >> /etc/sysctl.conf

mkdir -p /srv/swarm

# Configraciói NFS

echo 'master01:/srv/nfs /srv/swarm nfs defaults,nfsvers=3 0 0' >> /etc/fstab

apt install -y nfs-client

mount  -a

# configuració del Swarm

/srv/swarm/join.sh
vm.max_map_count=262144
