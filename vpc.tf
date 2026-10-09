locals {
  vpc_name         = "${var.name_prefix}-vpc"
  igw_name         = "${var.name_prefix}-igw"
  route_table_name = "${var.name_prefix}-rt"
}

# Step 5.1: VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}

# Step 5.2: Public subnets (a, b, c)
resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name_prefix}-subnet-public-${each.key}"
  }
}

# Step 5.3: Internet Gateway (attached to the VPC via vpc_id)
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = local.igw_name
  }
}

# Step 5.4: Route table with a default route to the IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.internet_cidr
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = local.route_table_name
  }
}

# Step 5.5: Associate every public subnet with the route table
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}