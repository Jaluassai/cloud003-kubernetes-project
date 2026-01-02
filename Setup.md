Running from Ansiblenode (ID 119) x.37

1. Demeter Cluster:
cd kubespray

docker run --rm -it --mount type=bind,source="$(pwd)"/inventory/demeter-clutster,dst=/inventory   --mount type=bind,source="${HOME}"/.ssh/id_rsa,dst=/root/.ssh/id_rsa   quay.io/kubespray/kubespray:v2.29.0 bash
ansible-playbook -i /inventory/inventory.ini --private-key /root/.ssh/id_rsa --become cluster.yml
OR
docker run --rm -it --mount type=bind,source="$(pwd)"/demeter-cluster,dst=/inventory   --mount type=bind,source="${HOME}"/.ssh/id_rsa,dst=/root/.ssh/id_rsa   quay.io/kubespray/kubespray:v2.29.0 bash

2. Hera Cluster
cd hera-cluster
sudo docker run --rm -it --mount type=bind,source="$(pwd)"/hera-cluster,dst=/inventory   --mount type=bind,source="${HOME}"/.ssh/id_rsa,dst=/root/.ssh/id_rsa   quay.io/kubespray/kubespray:v2.29.0 bash

ansible-playbook -i /inventory/inventory.ini --private-key /root/.ssh/id_rsa --become /inventory/cluster.yml