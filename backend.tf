terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-for-checkpoint-exam"
    key    = "eks/terraform.tfstate"
    region = "eu-north-1"
  }
}
