# Create a key pair
resource "aws_key_pair" "lab_key" {
  key_name   = "lab_key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name = var.keyname
  }
}
# Create EC2 instance in private subnet
resource "aws_instance" "private_instance" {
  ami           = "ami-03ed1381c73a5660e" 
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet_id
  key_name      = aws_key_pair.lab_key.key_name
  security_groups = [var.security_group_id]

  tags = {
    Name = var.private_instance_name
  }
}
# Create Bastion host in public subnet
resource "aws_instance" "bastion_host" {
  ami           = "ami-03ed1381c73a5660e" 
  instance_type = var.bastion_instance_type
  subnet_id     = var.public_subnet_id
  key_name      = aws_key_pair.lab_key.key_name
  security_groups = [var.security_group_id]

  tags = {
    Name = var.bastion_instance_name
  }
}
resource "aws_eip" "bastion_eip" {
  instance = "${aws_instance.bastion_host.id}"
}