## Kops

### Show Cluster
```kops get clusters```
### Validate cluster (check installation)
```kops validate cluster```
### Edit Cluster
```kops edit cluster```
### Update Cluster
```kops update cluster```
### Roll out Cluster Updates
```kops rolling-update cluster```


## Kubernetes

### Cluster info
```kubectl cluster-info```

### Get Basic Auth admin/pw
```kops get secrets kube --type secret -oplaintext```
```kubectl config view --minify```

### Create Deployment
```kubectl run hello-world --replicas=2 --labels="run=testserver" --image=coodoogmbh/testserver:1.0.0 --port=3000```
### Create Service to expose the deployment
```kubectl expose deployment hello-world --type=NodePort --name=testserver```
```kubectl describe services testserver```
### List Pods
```kubectl get pods --output=wide --selector="run=testserver"```
### List Deployments
```kuectl get deployments```
### List ReplicaSets
```kubectl get replicasets```
### List Services
```kubectl get services --output=wide --selector="run=testserver"```
### Delete Service
```kubectl delete services testserver```