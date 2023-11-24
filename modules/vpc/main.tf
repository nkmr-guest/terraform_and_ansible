data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "MyFirstVPC" {
  cidr_block           = var.vpc_config.cidr_block
  enable_dns_hostnames = var.vpc_config.enable_dns_hostnames
  enable_dns_support   = var.vpc_config.enable_dns_support
  tags = {
    Name = "${var.vpc_config.NameTag}-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.MyFirstVPC.id
  tags = {
    Name = "${var.vpc_config.NameTag}-IGW"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.MyFirstVPC.id
  cidr_block              = cidrsubnet(aws_vpc.MyFirstVPC.cidr_block, 8, 0) # 単一のサブネット
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.vpc_config.NameTag}-PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.MyFirstVPC.id
  cidr_block              = cidrsubnet(aws_vpc.MyFirstVPC.cidr_block, 8, 1) # 単一のサブネット
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.vpc_config.NameTag}-PrivateSubnet"
  }
}
