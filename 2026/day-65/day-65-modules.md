# Day 65 -- Terraform Modules: Build Reusable Infrastructure

### Task 1: Understand Module Structure

module structure

![alt text](day-65-modules_directory_structure.jpg)

### Task 2: Build a Custom EC2 Module

created a custom ec2 module `modules/ec2-instance/`

1. `variables.tf`

![alt text](day-65-ec2module-variables.jpg)

2. `main.tf`

![](day-65-ec2module-main.jpg)alt text


3. `provider.tf`

![alt text](day-65-ec2-module-provider.jpg)

4. `output.tf`

![alt text](day-65-ec2module-output.jpg)


### Task 3: Build a Custom Security Group Module

1. `variables.tf`

![alt text](day-65-securitymodule-variables.jpg)

2. `main.tf`

![alt text](day-65-securitymodule-main.jpg)

3. `output.tf`

![alt text](day-65-securitymodule-output.jpg)

4. `provider.tf`

![alt text](day-65-securitymodule-provider.jpg)


### Task 4: Call Your Modules from Root

1. Create a VPC and subnet directly

![alt text](image.png)

![alt text](image-1.png)

2. Call the security group module:

![alt text](image-2.png)

3. Call the EC2 module -- deploy **two instances** with different names using the same module:

![alt text](image-3.png)

4. Add root outputs that reference module outputs:

![alt text](image-4.png)

5. Apply:
```bash
terraform init    # Downloads/links the local modules
terraform plan    # Should show all resources from both module calls
terraform apply
```

this will create two instances with different names using the same module and outputs their public ip address

![alt text](day-65-ec2instancescreated.jpg)

![alt text](day-65-ec2-instancesaws.jpg) `2 instances same SG different names`

### Task 5: Use a Public Registry Module

1. Replace your hand-written VPC resources with:

![alt text](image-5.png)

2. Update your EC2 and SG module calls to reference `module.vpc.vpc_id` and `module.vpc.public_subnets[0]`

![alt text](image-6.png)

3. Run:
```bash
terraform init     # Downloads the registry module
terraform plan
terraform apply
```

4. Compare: how many resources did the VPC module create vs your hand-written VPC from Day 62?

the VPC module created 14 resources when compared to the hand-written VPC which is 5


### Task 6: Module Versioning and Best Practices

### Task 6: Module Versioning and Best Practices
1. Pin your registry module version explicitly:
   - `version = "5.1.0"` -- exact version
   - `version = "~> 5.0"` -- any 5.x version
   - `version = ">= 5.0, < 6.0"` -- range

2. Run `terraform init -upgrade` to check for newer versions

3. Check the state to see how modules appear:
```bash
terraform state list
```

![alt text](image-7.png) `shows how the modules appear`

```bash
terraform destroy 

```
destroy all the resources created
