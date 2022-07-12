resource "aws_subnet" "public" {
  count                   = var.AZCount
  vpc_id                  = aws_vpc.this.id
  availability_zone       = data.aws_availability_zones.available_azs.names[count.index]
  cidr_block              = var.publicSubnetCidrs[count.index]
  map_public_ip_on_launch = true
  tags                    = {
    Name = "public-subnet${count.index}-${var.environmentName}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = {
    Name = "igw-${var.environmentName}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags                    = {
    Name = "igw-route-table-${var.environmentName}"
  }
}

resource "aws_route_table_association" "public_subnet_routes" {
  count          = var.AZCount
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat_gateway_eips" {
  count = var.createNATGateways ? var.AZCount : 0
  vpc   = true
  tags  = {
    Name = "eip${count.index}-${var.environmentName}"
  }
}

resource "aws_nat_gateway" "this" {
  count         = var.createNATGateways ? var.AZCount : 0
  allocation_id = aws_eip.nat_gateway_eips[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = {
    Name = "nat-gateway${count.index}-${var.environmentName}"
  }
}