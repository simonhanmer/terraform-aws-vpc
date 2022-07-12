resource "aws_vpc" "this" {
  cidr_block           = var.vpcCidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = {
    Name = "vpc-${var.environmentName}"
  }
}
