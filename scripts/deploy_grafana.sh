#! /bin/bash

function config_hostname(){
    # Edita o hostname
    hostname_server="grafana-server"
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

function deploy_grafana() {
    docker run -d -p 3000:3000 grafana/grafana-oss
}

function main() {
    config_hostname
    install_docker
    deploy_grafana
}

# Start da Mágica
main