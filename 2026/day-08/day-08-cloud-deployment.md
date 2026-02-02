**deploy a real web server on the cloud**

deploy an ec2 instance 
download the key pair and change the pemission of the .pem key using chmod 400 <file-name.pem>
connect to the instance using the generated key pair
confirm successful connection
if ssh fails check if the service is in started state
if yes, then check you are able to listen on port 22
allow inbound traffic on port 22 for successful connection
once connected install nginx on the server
run sudo apt update and sudo apt install nginx on the server
post installation confirm the service is running using systemctl status nginx command
run curl -i http://public-ip to confirm or in browser type in http://public-ip to confirm
You should be able to see webpage Welcome to nginx!
inspect the logs under nginx by navigating to root and from there to the /log directory /var/log/nginx, you should be able to see the generated logs for nginx there

faced challenges with ssh fixed by allowing the traffic on ssh 22 
also faced challenge wrt the .pem file while changing permissions using chmod
deployment of webserver is real quick 