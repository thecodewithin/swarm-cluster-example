apt install -y git
curl https://get.docker.com | sudo bash

mkdir -m 1777 /srv/nfs
mkdir -p /srv/swarm

# Configraciói NFS

apt install -y nfs-kernel-server

echo '/sev/nfs 10.132.0.0/24(rw,no_root_swash,no_subtree_check)' >> /etc/exports

echo 'master01:/srv/nfs /srv/swarm nfs defaults,nfsver=3 0 0' >> /etc/fstab

systemctl restart nfs-kenel-server
mount  -a

# configuració del Swarm

docker swarm init
docker swarm join-token manager | grep join > /srv/swarm/join.sh
chmod +x $!

cd /srv/swarm
#git clone https://github.com/thecodewithin/swarm-cluster-example

docker network create proxy -d overlay
docker network create portainer_agent -d overlay

