
#file : ansible/playbooks/env_variables
    #MODIFY ad_addr: to the master nodes ip or the controllers ip

#file : ansible/hosts
    #MODIFY kube-master ansible_host and kube-worker-1 ansible_host
    and the passwords if required

#to install kubectl on another node

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    mkdir -p ~/.kube
    touch ~/.kube/config

    #copy/scp the contents of ~/.kube/config from master to this host where you want to access the cluster

    kubectl cluster-info --> to check if it worked


## setup autocomplete in bash into the current shell, bash-completion package should be installed first.
    source <(kubectl completion bash)

## add autocomplete permanently to your bash shell.
    echo "source <(kubectl completion bash)" >> ~/.bashrc
 
