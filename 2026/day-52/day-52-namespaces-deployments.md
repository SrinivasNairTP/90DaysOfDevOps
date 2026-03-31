### Task 1: Explore Default Namespaces

Explore built-in namespaces with below command

kubectl get namespaces

![alt text](image-1.png)

I get to see the above pods running in the default namespace 
 -control plane
 -ApiServer
 -Scheduler and
 -Proxy

![alt text](image-2.png)

I get to see a count of 14 pods in kube-system

### Task 2: Create and Use Custom Namespaces

![alt text](image.png)

create a namespace using yaml

![alt text](image-3.png)

once created use the following command
kubectl apply -f namespace.yaml

created namespace using yaml

![alt text](image-4.png)

run an nginx pod in dev

kubectl run nginx-dev --image=nginx:latest -n dev

kubectl run nginx-prod --image=nginx:latest -n prod

![alt text](image-5.png)

kubetctl get pods -A

commands to get pods present across all the namespaces

kubectl get pods -A

![alt text](image-6.png)

### Task 3: Create Your First Deployment

![alt text](image-9.png)

### Task 4: Self-Healing — Delete a Pod and Watch It Come Back
![alt text](image-10.png)

### Task 5: Scale the Deployment
Scale up/down the deployment

![alt text](image-8.png)

### Task 6: Rolling Update

kubectl set image deployment/nginx-deployment nginx=nginx:1.25 -n dev

kubectl rollout status deployment/nginx-deployment -n dev 

![alt text](image-7.png)

### Task 7: Clean Up

kubectl delete deployment nginx-deployment -n dev
kubectl delete pod nginx-dev -n dev

![alt text](image-11.png)