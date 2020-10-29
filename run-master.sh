apt install -y git bash-completion
curl https://get.docker.com | sudo bash

# Use valid user
#sudo usermod -G docker $USER

mkdir -m 1777 /srv/nfs
mkdir -p /srv/swarm

# Configraciói NFS

apt install -y nfs-kernel-server

echo '/srv/nfs 10.132.0.0/24(rw,no_root_squash,no_subtree_check)' >> /etc/exports

systemctl enable nfs-kernel-server
systemctl restart nfs-kernel-server

echo 'master01:/srv/nfs /srv/swarm nfs defaults,nfsvers=3 0 0' >> /etc/fstab

mount  -a

mkdir -p /srv/swarm/{portainer,wp_db,wp_data,logstash_pipeline,elastic_data,telegraf_config,influxdb_data,influxdb_config,grafana_data}

# configuració del Swarm

docker swarm init
docker swarm join-token manager | grep join > /srv/swarm/join.sh
#chmod +x !$
chmod +x /srv/swarm/join.sh

cd /srv/swarm
git clone https://github.com/thecodewithin/swarm-cluster-example

docker network create proxy -d overlay
docker network create portainer_agent -d overlay
