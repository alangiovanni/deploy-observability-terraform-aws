output "comando_ssh_zabbix" {
  value       = "ssh -i ${var.key_par}.pem ubuntu@${aws_instance.zabbix_server.public_dns}"
  description = "Comando SSH para acessar o Zabbix Server."
}

output "comando_ssh_grafana_server" {
  value       = "ssh -i ${var.key_par}.pem ubuntu@${aws_instance.grafana_server.public_dns}"
  description = "Comando SSH para acessar o WEB Server."
}

output "link_grafana" {
  value       = "http://${aws_instance.grafana_server.public_ip}:3000"
  description = "URL para acessar o web site provisionado."
}

output "link_zabbix" {
  value       = "http://${aws_instance.zabbix_server.public_ip}"
  description = "URL para acessar o web site provisionado."
}