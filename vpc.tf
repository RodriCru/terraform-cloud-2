resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  #cidr_block = lookup(var.ohio_cidr,terraform.workspace)
  tags = {
    "Name" = "VPC_Ohio-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_ohio.id
  #cidr_block = var.public_subnet
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public_subnet_temp-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_ohio.id
  #cidr_block = var.private_subnet
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "Private_subnet_temp-${local.sufix}"
  }
  depends_on = [ aws_subnet.public_subnet ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_ohio.id
  tags = {
    Name = "igw vpc ohio-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_ohio.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags ={
    Name = "public crt-${local.sufix}"
  }  
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name = "Public Instance SG"
  description = "Allow ssh inbound traffic and all egress traffic"
  vpc_id = aws_vpc.vpc_ohio.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}