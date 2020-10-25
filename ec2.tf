module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = var.name
  instance_count = 1

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  key_name               = "vitor-mariano"
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id, module.ssh_sg.this_security_group_id, module.all_traffic_outbound_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
