apt install -y git
curl https://get.docker.com | sudo bash

mkdir -m 1777 /srv/nfs
mkdir -p /srv/swarm

# Configraciói NFS

apt install -y nfs-kernel-server

echo '/srv/nfs 10.132.0.0/24(rw,no_root_squash,no_subtree_check)' >> /etc/exports

systemctl enable nfs-kernel-server
systemctl start nfs-kernel-server

echo 'master01:/srv/nfs /srv/swarm nfs defaults,nfsvers=3 0 0' >> /etc/fstab

mount  -a

mkdir -p /serv/swarm/{portainer,wp_db,wp_data}

# configuració del Swarm

docker swarm init
docker swarm join-token manager | grep join > /srv/swarm/join.sh
chmod +x /srv/swarm/join.sh

cd /srv/swarm
git clone https://github.com/thecodewithin/swarm-cluster-example

docker network create proxy -d overlay
docker network create portainer_agent -d overlay
