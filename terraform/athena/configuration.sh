#!/bin/bash

function installGit {
    sudo apt -y install git gh gnupg software-properties-common
}

function installTerraform {
    wget -O- https://apt.releases.hashicorp.com/gpg | \
        gpg --dearmor | \
        sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring \
        --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
        --fingerprint
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt -y update
    sudo apt -y install terraform
}

function installDocker {
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
}

function updateBranch {
    cd $1
    env=${2:-'local'}
    git checkout $env
    git pull
    yarn
    cd ..
}

function moveDockerfile {
    cp ${1}.Dockerfile ${1}/Dockerfile
}

function main {
    git --version || installGit
    terraform --version || installTerraform
    docker --version || installDocker

    APP="pegasus"
    updateBranch $APP "feature/update-new-relic"
    moveDockerfile $APP
}

main