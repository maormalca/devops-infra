terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Creates an ECR repository for storing Docker images
resource "aws_ecr_repository" "counter_service" {
  name                  = "counter-service-repo"
  image_tag_mutability = "MUTABLE"
  
  force_delete = true   # this will remove all images when deleting the repo
}

# EKS cluster using a module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = "1.33"
  endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnets
}

# Outputs for use in CI/CD or kubectl configuration
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "ecr_repository_url" {
  value = aws_ecr_repository.counter_service.repository_url
}
