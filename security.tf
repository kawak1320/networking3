resource "aws_security_group" "mp_allow_ssh" {
  name        = "mp_allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.mp_networking3_vpc.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mp_allow_ssh"
  }
}

//TODO ver como sube .pem a la public ec2 para probar conexiones entre ellas
// (en video de clase)
resource "aws_security_group" "mp_allow_ec2_ssh" {
  name        = "mp_allow_ec2_ssh"
  description = "Allow ssh inbound traffic between ec2s"
  vpc_id      = aws_vpc.mp_networking3_vpc.id

  ingress {
    description = "ssh from ec2s"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.2.192/26"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mp_allow_ec2_ssh"
  }
}

resource "aws_security_group" "mp_allow_icmp" {
  name        = "mp_allow_icmp"
  description = "Allow ICMP inbound traffic"
  vpc_id      = aws_vpc.mp_networking3_vpc.id

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["192.168.2.192/26"]
  }

  egress {

    from_port        = 8
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]

    # from_port        = 0
    # to_port          = 0
    # protocol         = "-1"
    # cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mp_allow_icmp"
  }
}