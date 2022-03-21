resource "aws_vpc" "main_test_vpc" {
  cidr_block               = var.ipv4_cidr_block
  enable_dns_support       = var.enable_dns_support
  enable_dns_hostnames     = var.enable_dns_hostnames
  instance_tenancy         = var.instance_tenancy

  tags = {
    Name = var.name_tag
  }
}

# aws_subnet.main_test_subnet.id
resource "aws_subnet" "main_test_subnet" {
  vpc_id                  = aws_vpc.main_test_vpc.id
  cidr_block              = var.subnet_ip4_cidr_block
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = var.ec2_map_public_ip_on_launch

  tags = {
    Name = var.name_tag
  }
}

# aws_security_group.main_test_security_group.id
resource "aws_security_group" "main_test_security_group" {
  name               = var.securyty_group_name
  vpc_id             = aws_vpc.main_test_vpc.id

  ingress {
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.ingres_protocol
    cidr_blocks      = [var.ingress_cidr_block]
  }

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = [var.egress_cidr_blocks]
  }

  tags = {
    Name = var.name_tag
  }
}

resource "aws_internet_gateway" "main_test_internet_gateway" {
  vpc_id            = aws_vpc.main_test_vpc.id

  tags = {
    Name = var.name_tag
  }
}

resource "aws_main_route_table_association" "main_test_main_route_table_association" {
  vpc_id            = aws_vpc.main_test_vpc.id
  route_table_id    = aws_route_table.main_test_route_table.id
}

resource "aws_route_table" "main_test_route_table" {
  vpc_id = aws_vpc.main_test_vpc.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.main_test_internet_gateway.id
  }

  tags = {
    Name = var.name_tag
  }
}