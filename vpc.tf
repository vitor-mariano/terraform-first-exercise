module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1e"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true

  tags = {
    Name        = var.name
    Terraform   = "true"
    Environment = "dev"
  }
}
