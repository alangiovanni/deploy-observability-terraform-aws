# IaC - Infraestructure as Code
	🚧  Deploy de um ambiente de monitoria na AWS com Terraform 🚀 Em andamento  🚧
<p align="center">
 <a href="#-sobre-o-projeto">Sobre</a> •
 <a href="#-funcionalidades">Funcionalidades</a> •
 <a href="#-pr%C3%A9-requisitos">Pré-requisitos</a> •
 <a href="#-instala%C3%A7%C3%A3o">Instalação</a> •
 <a href="#%EF%B8%8F-configura%C3%A7%C3%A3o">Configuração</a> •
 <a href="#-deploy">Deploy</a> •
 <a href="#-autor">Autor</a>
</p>

## 💻 Sobre o projeto

Provisionar uma infraestrutura na AWS com Terraform

## 💪 Funcionalidades

- [x] Cria EC2
- [x] Cria Security Groups
- [x] Configura as instâncias através de script no user-data
    - [x] Deploy de Zabbix Server em Docker
    - [x] Deploy de Grafana Server em Docker
    - [x] Hostname
- [ ] Deploy com Docker Compose

---

### 🛠 Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com) e [Terraform - v1.0.0](https://www.terraform.io).

Na AWS, obtenha uma "Key Par", uma Access Key de um usuário com permissões de administrador e o ID do Security Group default.

---

### 🎲 Instalação

```bash
# Clone este repositório
$ git clone https://github.com/alangiovanni/deploy-observability-terraform-aws.git

# Acesse a pasta do projeto no terminal/cmd
$ cd deploy-observability-terraform-aws

# Copie a chave (key par) que você baixou da AWS para dentro da pasta corrente
$ cp -p ~/Downloads/<key_par>.pem .

# Permissões necessárias para a chave
$ chmod 400 <key_par>.pem

```

---

### ⚙️ Configuração
Procure o arquivo de variáveis, variables.tf, para alterar algumas variáveis para que o provisionamento funcione adequadamente em seu ambiente. Abaixo segue um trecho do código onde as alterações devem ser realizadas.

```

variable "secret_key_terraform" {
  default     = "<SECRET KEY>"
  description = "Secret Key"
}

variable "access_key_terraform" {
  default     = "<ACCESS KEY>"
  description = "Access Key"
}

variable "sg_default" {
  type = string
  default = "<SG ID>"
}

variable "key_par" {
  type = map(string)
  default = "<NOME DA KEY PAR>"
}

```

---

### 🚀 Deploy

```bash
# Verifique a versão - Recomendo a versão v1.0.0
$ terraform --version

# init
$ terraform init

# Plan
$ terraform plan

# Apply com confirmação
$ terraform apply --auto-approve

# Obs: Os recursos serão provisionados em us-east-1

```

---

## 🦸 Autor

Alan Giovanni

[![Linkedin Badge](https://img.shields.io/badge/-Alan_Giovanni-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/alan-giovanni-53aaa9ab/)](https://www.linkedin.com/in/alan-giovanni-53aaa9ab/) 
[![Gmail Badge](https://img.shields.io/badge/-agmtargino@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:agmtargino@gmail.com)](mailto:agmtargino@gmail.com)