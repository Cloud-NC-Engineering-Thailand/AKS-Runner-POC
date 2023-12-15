# ARC Runner
## Prerequisites 
**1. Organization Runner**

- **GitHub Account:** Ensure that you have a GitHub account with owner privileges for the organization where you want to set up the runner.
  
**2. Repository Runner**

- **GitHub Account:** Have a GitHub account with admin privileges for the repository where you want to set up the runner.


**3. GitHub Personal Access Token** : Can be generated on the Settings page of your GitHub account, under Developer settings > Personal access tokens.

## Part 1 Setting up AKS Cluster 
1. Create AKS cluster 
2. Connect to AKS in terminal
```bash 
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```
## Part 2 Installing ARC on the Cluster 
1. Create github token and run the following command, replacing ${GITHUB_TOKEN} with your GitHub Personal Access Token 
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
