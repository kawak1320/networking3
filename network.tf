/*  
  * Hosts:          need - total
  * Network:         650 - 4096 -> 192.168.0.0/20
  * Office 2:        500 - 512 -> 192.168.0.0/23
  * Office 1:         80 - 128 -> 192.168.2.0/25
  * Office 3:         40 - 64 -> 192.168.2.128/26
  * Remote Office:    30 - 64 -> 192.168.2.192/26
*/

//vpc
//4096 hosts
resource "aws_vpc" "mp_networking3_vpc" {
  cidr_block       = "192.168.0.0/20"
  instance_tenancy = "default"

  tags = {
    Name = "mp_networking3_vpc"
  }
}

//private subnets
//Office 2: 500 hosts
resource "aws_subnet" "mp_private_subnet_office_2" {
  vpc_id     = aws_vpc.mp_networking3_vpc.id
  cidr_block = "192.168.0.0/23"

  tags = {
    Name = "mp_private_subnet_office_2"
  }
}

//Office 1: 80 hosts
resource "aws_subnet" "mp_private_subnet_office_1" {
  vpc_id     = aws_vpc.mp_networking3_vpc.id
  cidr_block = "192.168.2.0/25"

  tags = {
    Name = "mp_private_subnet_office_1"
  }
}

//Office 3: 40 hosts
resource "aws_subnet" "mp_private_subnet_office_3" {
  vpc_id     = aws_vpc.mp_networking3_vpc.id
  cidr_block = "192.168.2.128/26"

  tags = {
    Name = "mp_private_subnet_office_3"
  }
}

//public subnet
//Remote Office: 30 hosts
resource "aws_subnet" "mp_public_subnet_remoteOffice" {
  vpc_id     = aws_vpc.mp_networking3_vpc.id
  cidr_block = "192.168.2.192/26"

  tags = {
    Name = "mp_public_subnet_remoteOffice"
  }
}

//internet gateway
resource "aws_internet_gateway" "mp_networking3_igw" {
  vpc_id = aws_vpc.mp_networking3_vpc.id

  tags = {
    Name = "mp_networking3_igw"
  }
}

//route table through igw
resource "aws_route_table" "mp_networking3_rt" {
  vpc_id = aws_vpc.mp_networking3_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mp_networking3_igw.id
  }

  tags = {
    Name = "mp_networking3_rt"
  }
}

//public route table association 
resource "aws_route_table_association" "mp_networking3_rta_public" {
  subnet_id      = aws_subnet.mp_public_subnet_remoteOffice.id
  route_table_id = aws_route_table.mp_networking3_rt.id
}