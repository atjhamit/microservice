--POD--
Create an NGINX pod
    kubectl run nginx --image=nginx

Generate POD Manifest YAML file (-o yaml). Dont create it (-dry-run)
    kubectl run nginx --image=nginx --dry-run=client -o yaml

--DEPLOYMENT--
Create a deployment
    kubectl create deployment --image=nginx nginx
    or
    kubectl scale deployment nginx --replicas=4

Generate Deployment YAML file (-o yaml). Dont create it (-dry-run)
    kubectl create deployment --image=nginx --dry-run=client -o yaml

Generate Deployment with 4 replicas
    kubectl create deployment --image=nginx --replicas=4
    kubectl create deployment --image=nginx --replicas=4 --dry-run=client -o yaml > abc.yaml

--SERVICE--
    kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
    kubectl expose pod nginx --port=80 --name=nginx-service --type=NodePort --dry-run=client -o yaml > abc.yaml

    kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml


Create a Service named nginx of type NodePort to expose pod nginx’s port 80 on port 30080 on the nodes:
    kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml

    (This will automatically use the pod’s labels as selectors, but you cannot specify the node port. You have to generate a definition file and then add the node port in manually before creating the service with the pod.)  

or,

    kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml

    (This will not use the pods labels as selectors)

    Both the above commands have their own challenges. While one of it cannot accept a selector the other cannot accept a node port. I would recommend going with the `kubectl expose` command. If you need to specify a node port, generate a definition file using the same command and manually input the nodeport before creating the service.


source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.


