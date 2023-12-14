# ARC Runner
## Part 1 Setting up AKS Cluster 
1. Create AKS cluster 
2. Connect to AKS in terminal
```bash 
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```
## Part 2 Installing ARC on the Cluster 
1. Create github token and run the following command, replacing ${GITHUB_TOKEN} with your GitHub token 
```bash 
kubectl create secret generic controller-manager --from-literal=github_token=${GITHUB_TOKEN}
```

2. Add ARC helm repo 
```bash
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
```

3. Install ARC on the cluster
```bash
helm upgrade --install arc actions-runner-controller/actions-runner-controller --set certManagerEnabled=false
```
## Part 3 Deploying Runners 
1. Create runner yaml manifest for your runner configuration.

2. Apply the runner yaml
example:
```bash
kubectl apply -f runner.yaml
```
