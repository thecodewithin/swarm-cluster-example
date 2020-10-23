apt install -y git
curl https://get.docker.com | sudo bash

mkdir -p /srv/swarm

# Configraciói NFS

echo 'master01:/srv/nfs /srv/swarm nfs defaults,nfsver=3 0 0' >> /etc/fstab

apt install -y nfs-client

mount  -a

# configuració del Swarm

/srv/docker/join.sh
