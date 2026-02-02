# Deploy a Real Web Server on the Cloud

## Steps

1. **Deploy an EC2 Instance**
    - Download the key pair
    - Change permissions: `chmod 400 <file-name.pem>`

2. **Connect to the Instance**
    - Use the generated key pair to connect via SSH
    - Confirm successful connection

3. **Troubleshoot SSH (if needed)**
    - Verify the SSH service is started
    - Check if port 22 is listening
    - Allow inbound traffic on port 22 in security groups

4. **Install and Configure Nginx**
    - Run `sudo apt update && sudo apt install nginx`
    - Verify service status: `systemctl status nginx`

5. **Verify Deployment**
    - Test via CLI: `curl -i http://<public-ip>`
    - Or open browser: `http://<public-ip>`
    - Confirm "Welcome to nginx!" page appears

6. **Review Logs**
    - Navigate to `/var/log/nginx`
    - Review generated nginx logs

## Challenges Faced

- SSH connection issues: resolved by allowing inbound traffic on port 22
- File permission issues with `.pem` file: resolved using `chmod`

**Note:** Web server deployment is straightforward once connectivity is established.