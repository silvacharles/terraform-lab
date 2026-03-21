terraform {
  # Especifica a versão mínima do Terraform necessária para este projeto
  # Compativel com o Opentofu
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }
  # Configuração do backend para armazenar o estado do Terraform no S3
  backend "s3" {
    bucket = "charlessilva-remote-state"
    key    = "aws-wordpress/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      owner      = "charlessilva"
      managed-by = "terraform"
    }
  }
}
# Configuração dos recursos AWS para criar uma instância EC2 com WordPress
# Liberando as portas 22 (SSH), 80 (HTTP) e 443 (HTTPS) para acesso à instância
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP, HTTPS and SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["189.124.16.0/20"]
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = (file("${path.module}/aws-key.pub"))
}

resource "aws_instance" "wordpress_server" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/userdata.sh")
  #user_data_base64 = base64gzip(file("${path.module}/userdata.sh"))

  tags = {
    Name = "wordpress-traefik-server"
  }
}