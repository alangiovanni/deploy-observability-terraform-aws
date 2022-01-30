# EC2 1
resource "aws_instance" "zabbix_server" {
  ami           = var.ami_linux
  instance_type = var.tipo_ec2
  # Chave para acesso SSH configurada previamente na AWS (Key Par)
  key_name = var.key_par
  tags = {
    "Name" = "Zabbix Server"
    "Env"  = "${var.env}"
  }

  # Set SG
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}", "${aws_security_group.acesso_web.id}", "${var.sg_default}"]

  # Set User Data
  user_data = file("scripts/deploy_zabbix.sh")
}

# EC2 2
resource "aws_instance" "grafana_server" {
  ami           = var.ami_linux
  instance_type = var.tipo_ec2
  # Chave para acesso SSH configurada previamente na AWS (Key Par)
  key_name = var.key_par
  tags = {
    "Name" = "Grafana Server"
    "Env"  = "${var.env}"
  }

  # Set SG
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}", "${aws_security_group.acesso_web.id}", "${var.sg_default}"]

  # Set User Data
  user_data = file("scripts/deploy_grafana.sh")
}