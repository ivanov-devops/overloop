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

# Infrastructure Deployment with Terraform

This repository contains Terraform configurations to deploy a simple web application infrastructure on AWS. The infrastructure includes an Application Load Balancer (ALB), EC2 instances serving as web servers, public subnets, and associated networking resources within a Virtual Private Cloud (VPC).

## Prerequisites

Before you begin, ensure you have the following:

- AWS account with appropriate permissions to create resources
- Terraform installed on your local machine

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/ivanov-devops/overloop.git
    ```

2. Navigate to the cloned directory:

    ```bash
    cd overloop
    ```

3. Navigate to the `shared/poc1` directory where the web application infrastructure is defined:

    ```bash
    cd shared/poc1
    ```

4. Initialize Terraform:

    ```bash
    terraform init
    ```

5. Review the `locals.tf` and `data.tf` files and update variables as needed, such as AWS region, profile, etc.

6. Review the Terraform plan:

    ```bash
    terraform plan
    ```

7. Apply the Terraform changes:

    ```bash
    terraform apply
    ```

8. After deployment, Terraform will output the ALB DNS name, public subnets, and security group ID.

9. Access the web application using the ALB DNS name.

## GitHub Actions Workflow

The repository includes a GitHub Actions workflow named "Terraform Plan" that automatically runs Terraform plan whenever changes are pushed to the `main` branch. Here's what the workflow does:

- **Terraform Plan**: Checks out the repository, initializes Terraform, and runs `terraform plan` to generate an execution plan for changes to infrastructure.

## File Structure

The Terraform configuration files are organized as follows:

- `alb.tf`: Defines the Application Load Balancer (ALB).
- `backend.tf`: Configures the backend for storing Terraform state.
- `data.tf`: Defines data sources used in the configuration.
- `ec2.tf`: Defines EC2 instances.
- `locals.tf`: Declares local values and variables.
- `outputs.tf`: Specifies the outputs to display after Terraform applies changes.
- `providers.tf`: Configures the providers, such as AWS.
- `user_data_nginx.sh`: Shell script for configuring Nginx on EC2 instances.
- `versions.tf`: Specifies the Terraform version constraints.
- `vpc.tf`: Defines the Virtual Private Cloud (VPC) and associated networking resources.

## Resources Created

- **Application Load Balancer (ALB)**: Routes incoming HTTP traffic to EC2 instances.
- **EC2 Instances**: Virtual servers hosting the web application.
- **Subnets**: Public subnets for hosting EC2 instances.
- **Security Groups**: Controls inbound and outbound traffic to EC2 instances.
- **VPC (Virtual Private Cloud)**: Provides an isolated network environment for the infrastructure.

# Other Demos

In addition to the web application infrastructure, there is another demo available for installing VPC and EKS in the `shared/poc` folder.

## Cleanup

To destroy the deployed infrastructure and release AWS resources, run:

```bash
terraform destroy
