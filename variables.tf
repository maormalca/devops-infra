variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"  # Stockholm
}


variable "cluster_name" {
  type    = string
  default = "counter-eks-cluster"
}

variable "vpc_id" {
  type = string 
  default = "vpc-0ee6e732b7d75ce9f"
}

variable "subnets" {
  description = "List of public subnet IDs for the cluster (2 AZs minimum)"
  type        = list(string)
  default     = [
    "subnet-0a2a0998c61019edb",
    "subnet-031f9a7926654ce6b"
  ]
}

