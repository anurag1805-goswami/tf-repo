resource "aws_vpc" "naga_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "terraform-managed-"
  }
}


resource "aws_subnet" "naga_subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.naga_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "naga-${var.subnet_names[count.index]}"

  }
}


resource "aws_internet_gateway" "naga_igw" {
  vpc_id = aws_vpc.naga_vpc.id

  tags = {
    Name = "naga_igw"
  }
}


resource "aws_route_table" "igw_rt" {
  vpc_id = aws_vpc.naga_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.naga_igw.id
  }

  tags = {
    Name = "naga-route-table"
  }

  

}

resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.naga_subnets[count.index].id
  route_table_id = aws_route_table.igw_rt.id
}