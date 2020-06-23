echo "[TASK 1] Create user"
source env
sudo useradd "${USERNAME}"
sudo usermod -aG wheel "${USERNAME}"
sudo usermod -aG docker "${USERNAME}"

echo "[TASK 2] Initialize a swarm"
docker swarm  init --advertise-addr "${MANAGER_IP}" > "join.txt"

# Open required ports in all nodes

# Task shoul only run in worker nodes
echo "[TASK 3] Join master from workers"
cat "join.txt"