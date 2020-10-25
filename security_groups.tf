module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-server"
  description = "Security group for web-server with HTTP and HTTPS ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
}

module "ssh_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ssh"
  description = "Security group for SSH access"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
}

module "all_traffic_outbound_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "all-traffic-outbound"
  description = "Security group for allowing all traffic outbound"
  vpc_id      = module.vpc.vpc_id

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
}
