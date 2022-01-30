#! /bin/bash

function config_hostname(){
    # Edita o hostname
    hostname_server="zabbix-server"
    sudo hostname $hostname_server
    sudo echo "127.0.1.1 $hostname_server" >> /etc/hosts
}

function install_docker(){
    sudo apt update -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt update -y
    sudo apt install docker-ce -y
    sudo usermod -aG docker ubuntu
}

function deploy_zabbix() {
    mysql_database="zabbix"
    mysql_user="zabbix"
    mysql_password="zabbix_password"
    mysql_root="YjA0OTYwZDBiN2EwNWFjMTRjZGU3Yjcy"

    # Banco de Dados Mysql
    sudo docker run --name mysql-server -t -e MYSQL_DATABASE="$mysql_database" -e MYSQL_USER="$mysql_user" -e MYSQL_PASSWORD="$mysql_password" -e MYSQL_ROOT_PASSWORD="$mysql_root" -d mysql --character-set-server=utf8 --collation-server=utf8_bin --default-authentication-plugin=mysql_native_password
    # Zabbix Server
    sudo docker run --name zabbix-server-mysql -t -e DB_SERVER_HOST="mysql-server" -e MYSQL_DATABASE="$mysql_database" -e MYSQL_USER="$mysql_user" -e MYSQL_PASSWORD="$mysql_password" -e MYSQL_ROOT_PASSWORD="$mysql_root" --link mysql-server:mysql -p 10051:10051 --restart unless-stopped -d zabbix/zabbix-server-mysql
    # Zabbix WEB
    sudo docker run --name zabbix-web-nginx-mysql -t -e DB_SERVER_HOST="mysql-server" -e MYSQL_DATABASE="$mysql_database" -e MYSQL_USER="$mysql_user" -e MYSQL_PASSWORD="$mysql_password" -e MYSQL_ROOT_PASSWORD="$mysql_root" --link mysql-server:mysql --link zabbix-server-mysql:zabbix-server -p 80:8080 --restart unless-stopped -d zabbix/zabbix-web-nginx-mysql
    # Zabbix Agent
    sudo docker run --name zabbix-agent --link mysql-server:mysql --link zabbix-server-mysql:zabbix-server -e ZBX_HOSTNAME="Zabbix server" -e ZBX_SERVER_HOST="zabbix-server" -d zabbix/zabbix-agent   
}

function main() {
    config_hostname
    install_docker
    deploy_zabbix
}

# Start da Mágica
main