AWS Terraform Exercise

Create a Terraform configuration to deploy a simple web application in AWS.

Requirements:
1. Create a VPC with two public subnets in different availability zones.
2. Deploy an EC2 instance in each subnet.
3. Each EC2 instance should run a simple web server (e.g., Apache or Nginx).
4. Configure a security group to allow HTTP traffic to the EC2 instances.
5. Use an Application Load Balancer to distribute traffic between the two instances.
6. Output the DNS name of the Load Balancer.

Instructions:
- Provide a Terraform configuration file(s) with comments explaining your choices.
- Explain how you would validate the deployment and ensure that the web application is accessible.
