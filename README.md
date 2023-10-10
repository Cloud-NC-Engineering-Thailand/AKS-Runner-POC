# aks_runner
## ส่วนของการ setup cluster และ arc
### คำสั่ง connect aks in terminal 
```bash 
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```
#### ขั้นตอนการติดตั้ง arc ลง cluster
1. รันคำสั่งข้างล่าง และแทนด้วย token ที่เราสร้าง
```bash 
kubectl create secret generic controller-manager --from-literal=github_token=${GITHUB_TOKEN}
```

2. add repo arc โดยใช้คำสั่ง 
```bash
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
```

3. install arc ลงคลัสเตอร์ ใช้คำสั่ง
```bash
helm upgrade --install arc actions-runner-controller/actions-runner-controller --set certManagerEnabled=false
```

4. สร้าง yaml เพื่อ deploy runner ตามความต้องการเลย คำสั่งรัน yaml
```bash
kubectl apply -f runner.yaml
```
