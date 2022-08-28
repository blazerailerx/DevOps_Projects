# Project 15

## AWS Cloud solution for 2 Company Websites Using a Reverse Proxy Technology 
Summary: This project is aimed at building two websites for a company called Vecna Dynamics (😉). One of the websites would be the main production website and the other would be a tooling website for their devops team. 
1 VPC was created for the project
![](media/Project15_images/)
8 subnets were created from the VPC for each tier of the architecture
![](media/Project15_images/)
An internet gateway was created for the VPC
![](media/Project15_images/)
Then a route table was created, added to the two public subnets along with routes to all networks 0.0.0.0/0 to enable routing of traffic between that subnet and the internet.
![](media/Project15_images/)
! A NAT gateway was created and given an elastic ip address for the public subnet to enable resources on the private subnet communicate externally with the internet without the possibility of external resources communicating with the resources.
Note: NAT gateways are expensive so for this scenario only one was deployed to save cost.
![](media/Project15_images/)

Another route table was created for the proxy subnet and the business subnet because they contain resource that would need to pull data using the internet through the nat gateway. This route table will be responsible for routing traffic from the proxy subnets in both availability zones to the internet through the NAT gateway.
![](media/Project15_images/)

The public network requires some level of protection to control who or what has access to the resources placed on that subnet. So a security group was created and attached to the public security group.

Another security group was created for the Application Load Balancer to control inbound traffic to the subnet to just HTTP and HTTPS traffic. And outbound traffic set to all.
![](media/Project15_images/)

A target group was created to manage the distribution of traffic between instances in the auto-scaling group
![](media/Project15_images/)

An application load balancer was created to route between distribute the traffic between targets in the target group.
![](media/Project15_images/)

The next resource that was created was the launch template for the autoscaling group.

The launched template was selected to create used at the creation of the autoscaling group. The external load balancer was added to the ASG

![](media/Project15_images/)

<<<<<<< HEAD
The servers were spun up by changing the desired capacity of the Autoscaling group.

SSH forwarding was used for easier administration of the servers. The public key was added to the ssh-agent running on the host used to connect to our remote servers with the following command.

```bash
ssh-add <publickey.pem>
```
Afterwards, the public server was logged into with the "-A" flag and the key was passed over to subsequent servers.

One of the servers was CentOS 8 which is no longer supported and so there had to be a workaround to update it. Below is the steps for the workaround.

#### Step 1: Go to the /etc/yum.repos.d/ directory.
```bash
cd /etc/yum.repos.d/
```

#### Step 2: Run the below commands
```bash
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```

#### Step 3: Now run the yum update
```bash
yum update -y
```

```bash
#!/bin/bash
cd /etc/yum.repos.d/
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sudo yum update -y
sudo yum install -y nginx git
sudo systemctl restart nginx
sudo systemctl enable nginx
```

sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum install -y dnf-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum install -y nginx git
sudo systemctl restart nginx
=======
After NGINX is installed on the proxy server, it became accessible through the DNS address of the load balancer.

A hosted zone was created on route 53 with the project name vecnadynamics, and then a record tooling.vecnadynamics.com was created afterwards. 
![](media/Project15_images/)
Now to the third layer of the architecture.

Proactively, a security group was created for the subnet hosting the web servers. Allowing traffic from the Bastion and the internal load balancer. 
![](media/Project15_images/)

