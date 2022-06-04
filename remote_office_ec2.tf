data "aws_ami" "remoteOffice" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "mp_remote_office_ec2" {
  ami                         = data.aws_ami.remoteOffice.id
  subnet_id                   = aws_subnet.mp_public_subnet_remoteOffice.id
  vpc_security_group_ids      = [aws_security_group.mp_allow_ssh.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "mp_remote_office_ec2"
  }
}