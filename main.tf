provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

variable "name" {
  type    = string
  default = "parrybell"
}
