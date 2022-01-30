# SG
resource "aws_security_group" "acesso_ssh" {
  name        = "acesso-ssh"
  description = "Acessos Necessario para o ambiente proposto"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Acesso SSH"
    "Env"  = "${var.env}"
  }
}

resource "aws_security_group" "acesso_web" {
  name        = "acesso-web"
  description = "Acessos HTTP e HTTPS"

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

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Acessos WEB"
    "Env"  = "${var.env}"
  }
}