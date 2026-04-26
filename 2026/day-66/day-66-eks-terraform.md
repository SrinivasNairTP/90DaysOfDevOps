# Day 66 -- Provision an EKS Cluster with Terraform Modules

### Task 1: Project Setup

`provders.tf`

![alt text](image.png)

`vpc.tf`

![alt text](image-1.png)

`variables.tf`
![alt text](image-2.png)

### Task 2: Create the VPC with Registry Module

`vpc.tf` created making use of terraform module

![alt text](image-1.png)

terraform apply 
![alt text](day-66-EKS.jpg)

Why does EKS need both public and private subnets? What do the subnet tags do?

it does require both public and private subnets for EKS for internal and external communication

Internet → ALB (Public Subnet) → Pods (Private Subnet)
Pods → NAT Gateway → Internet

### Task 3: Create the EKS Cluster with Registry Module

`eks.tf` created usig terraform module

![alt text](image-3.png)

![alt text](image-4.png)

### Task 4: Apply and Connect kubectl

![alt text](day-66-EKS1.jpg)

4. Verify:

![alt text](day-66-EKS1-1.jpg)

### Task 5: Deploy a Workload on the Cluster

1. Create a file `k8s/nginx-deployment.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-terraweek
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
```

2. Apply:
```bash
kubectl apply -f k8s/nginx-deployment.yaml
```
3. Wait for the LoadBalancer to get an external IP:
```bash
kubectl get svc nginx-service -w

![alt text](image-5.png)

4. Access the Nginx page via the LoadBalancer URL

![alt text](image-6.png)

5. Verify the full picture:
```bash
kubectl get nodes
kubectl get deployments
kubectl get pods
kubectl get svc
```
![alt text](image-7.png)

nginx page loaded using external LB

![alt text](image-8.png)

### Task 6: Destroy Everything

1. First, remove the Kubernetes resources (so the AWS LoadBalancer gets deleted):
```bash
kubectl delete -f k8s/nginx-deployment.yaml
```

2. Wait for the LoadBalancer to be fully removed (check EC2 > Load Balancers in AWS console)

3. Destroy all Terraform resources:
```bash
terraform destroy
```
This will take 10-15 minutes.

4. Verify in the AWS console:
   - EKS clusters: empty
   - EC2 instances: no node group instances
   - VPC: the terraweek VPC should be gone
   - NAT Gateways: deleted
   - Elastic IPs: released

