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
    cd overloop/shared/poc1
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Review the `locals.tf` and `data.tf` files and update variables as needed, such as AWS region, profile, etc.

5. Review the Terraform plan:

    ```bash
    terraform plan
    ```

6. Apply the Terraform changes:

    ```bash
    terraform apply
    ```

7. After deployment, Terraform will output the ALB DNS name, public subnets, and security group ID.

8. Access the web application using the ALB DNS name.

## GitHub Actions Workflow

The repository includes a GitHub Actions workflow named "Terraform Plan" that automatically runs Terraform plan whenever changes are pushed to the `main` branch. Here's what the workflow does:

- **Terraform Plan**: Checks out the repository, initializes Terraform, and runs `terraform plan` to generate an execution plan for changes to infrastructure.

## Structure

The Terraform configuration files are organized as follows:

- `main.tf`: Contains the main infrastructure resources such as ALB, EC2 instances, subnets, etc.
- `locals.tf`: Defines local variables used within the configuration.
- `variables.tf`: Declares input variables used in the configuration.
- `outputs.tf`: Defines outputs to display after Terraform execution.

## Resources Created

- **Application Load Balancer (ALB)**: Routes incoming HTTP traffic to EC2 instances.
- **EC2 Instances**: Virtual servers hosting the web application.
- **Subnets**: Public subnets for hosting EC2 instances.
- **Security Groups**: Controls inbound and outbound traffic to EC2 instances.
- **VPC (Virtual Private Cloud)**: Provides an isolated network environment for the infrastructure.

## Cleanup

To destroy the deployed infrastructure and release AWS resources, run:

```bash
terraform destroy
