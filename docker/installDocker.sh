echo "removing older versions of docker"
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "updating repos"
sudo apt-get update

echo "sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release"

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release


echo "Add Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


echo "setting up stable repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "updating apt package index"
sudo apt-get update

echo "installing docker, docker-cli and containerd"
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "sudo groupadd docker"
sudo groupadd docker


echo "sudo usermod -aG docker $USER"
sudo usermod -aG docker $USER

logout
