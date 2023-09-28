# aks_runner
## ส่วนของการ setup cluster และ arc
### คำสั่ง connect aks in terminal 
* az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
#### ขั้นตอนการติดตั้ง arc
1. รันคำสั่ง kubectl create secret generic controller-manager --from-literal=github_token=${GITHUB_TOKEN}  แทนด้วย token ที่เราสร้าง
2. add repo arc โดยใช้คำสั่ง helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
3. install arc ลงคลัสเตอร์ ใช้คำสั่ง helm upgrade --install arc actions-runner-controller/actions-runner-controller --set certManagerEnabled=false
4. สร้าง yaml file สำหรับการ add runner to git repo โดยจะรันด้วยคำสั่ง  kubectl apply -f runnerdeployment.yaml
---
