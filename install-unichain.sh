#!/bin/bash

apt update
apt upgrade -y
apt install curl git net-tools -y 

source ~/.bashrc

git clone https://github.com/Uniswap/unichain-node.git

cd unichain-node/ && curl https://raw.githubusercontent.com/DenisHumen/config-file/refs/heads/main/.env.sepolia%20-%20unichain > .env.sepolia

bash <(curl -s https://raw.githubusercontent.com/DenisHumen/Scripts/refs/heads/main/install_docker.sh)

echo 'up nodes'

echo ''
docker compose up -d

echo 'Nodes link --   https://github.com/Uniswap/unichain-node'
