**Super Mario Game hosted on top of EKS**

Step1: Launch EC2 instance with t2.micro, ubuntu as AMI, allow rule for https and http of security group.
Step2: Create role with admin priviledges. Note - It is used by your ec2 instance to create EKS cluster and manage s3 bucket by applying this IAM role it gives the authenticity to your ec2 to do changes in aws account
Step3. Create S3 bucket for later use to store state file

Step4. Install Docker

sudo su
apt update -y
apt install docker.io
usermod -aG docker <USER-Name>    #provide your username in our case it is ubuntu
newgrp docker

Step5. Install terraform

sudo apt install wget -y
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

#Verify the key's fingerprint.
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

sudo apt update
sudo apt-get install terraform
terraform -help

Step6. Install CLI

sudo apt-get install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

Step7. Setup kubectl

sudo apt install curl -y
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#verification
which aws
which kubectl

Step8. mkdir super-mario
Step9. cd super-mario
Step10. git clone this branch
Step11. cd Deployment-of-super-Mario-on-Kubernetes-using-terraform/
Step12. cd EKS-TF

Note: Make sure to provide your bucket and region name in this file otherwise it doesn’t work and IAM role is also associated with your ec2 which helps ec2 to use other services such S3 bucket

Step13. Running Terraform commands

terraform init
terraform validate
terraform plan
terraform apply

Step14. After 5 to 10 minutes EKS Cluster will be launched. Now to switch inside the cluster, we need to run below command.

aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1

The command aws eks update-kubeconfig --name EKS_CLOUD --region us-east-1 is like telling our computer, "Hey, I'm using Amazon EKS in the 'ap-south-1' region, and I want to connect to it. you could use your desired location.

Step15. Apply deployment.yaml and service.yaml file

Step16. Now check the Loadbalancer Ingress by running "kubectl describe service mario-project-service"

Step17: hurray You landed to Mario Game Enjoy playing, URL for refrence: a3846e79a2a6c49eca1db21364415281-931196029.ap-south-1.elb.amazonaws.com
