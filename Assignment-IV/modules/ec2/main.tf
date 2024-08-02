resource "aws_instance" "bastion_host" {
  ami             = "ami-0b36f2748d7665334"
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  key_name        = aws_key_pair.lab_key.key_name
  security_groups = [var.security_group]

  tags = {
    Name      = "${terraform.workspace}-instance"
    Managedby = "Terraform"
  }
}
# Create a key pair
resource "aws_key_pair" "lab_key" {
  key_name   = "${terraform.workspace}-public-key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name = "${terraform.workspace}-public-key"
  }
}
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion_host.id
}