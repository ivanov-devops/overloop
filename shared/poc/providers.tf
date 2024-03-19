# providers.tf
provider "aws" {
  region  = local.aws_region
  default_tags {
    tags = {
      Terraform = "true"
    }
  }
}

provider "kubernetes" {
    host = data.aws_eks_cluster.cluster.endpoint
    token = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64encode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}
