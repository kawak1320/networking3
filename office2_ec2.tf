data "aws_ami" "office2" {
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

# resource "aws_instance" "web" {
resource "aws_instance" "mp_office2_ec2" {
  ami                         = data.aws_ami.office2.id
  subnet_id                   = aws_subnet.mp_private_subnet_office_2.id
  vpc_security_group_ids      = [aws_security_group.mp_allow_icmp.id, aws_security_group.mp_allow_ec2_ssh.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "mp_office2_ec2"
  }
}