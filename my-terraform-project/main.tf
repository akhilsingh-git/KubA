provider "aws" {
  region = var.region
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.generated_key_pair.public_key_openssh
}

resource "tls_private_key" "generated_key_pair" {
  algorithm = "RSA"
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0db245b76e5c21ca1" # Ubuntu 20.04 LTS image ID in the us-west-2 region.
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name

  vpc_security_group_ids = [
    aws_security_group.instance_sg.id
  ]

  tags = {
    Name = "ubuntu-instance"
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "ubuntu-instance-sg"
  description = "Security group for the Ubuntu instance."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

