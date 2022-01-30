variable "secret_key_terraform" {
  default     = "<Secret Key>"
  description = "Secret Key do usuario Terraform"
}

variable "access_key_terraform" {
  default     = "<Access Key>"
  description = "Acess Key do usuario Terraform"
}

variable "sg_default" {
  type = string
  # us-east-1
  default     = "<ID do SG Default>"
  description = "ID do Security Group Default"
}

variable "key_par" {
  type = string
  # us-east-1
  default     = "<Key Par>"
  description = "Nome da Key Par"
}

variable "ami_linux" {
  type = string
  # us-east-1
  default     = "ami-04505e74c0741db8d"
  description = "Ubuntu Server 20.04 LTS"
}

variable "tipo_ec2" {
  type    = string
  default = "t2.micro"
  description = "Tipo da instância"
}

variable "env" {
  type        = string
  default     = "LAB"
  description = "Tipo do Ambiente provisionado"
}