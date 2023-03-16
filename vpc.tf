# CREATE THE VPC, IGW and Subnet
# 1 VPC
# 1IGW
# Subnets (1 public, 1 private)
# ----------------------------------

resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  tags = {
    Owner = "aimeerim"
  }
}

resource "aws_internet_gateway" "vpc1_igw" {
  vpc_id = aws_vpc.vpc1.id 
  tags = {
    Owner = "aimeerim"
  } 
  depends_on = [aws_vpc.vpc1] # depends_on tells Terraform to complete the aws_vpc.vpc1 creation first before creation aws_internet_gateway vpc1_igw 
}

# creating subnets

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.cidr_block_public
  availability_zone       = var.availability_zone_public

  tags = {
    Owner   = "aimeerim"
  }
  depends_on = [aws_vpc.vpc1]
}
