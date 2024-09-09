#!/bin/bash

apt-get update 
apt-get upgrade -y
apt install curl -y
source ~/.bashrc


curl -s https://raw.githubusercontent.com/MeSmallMan/logo/main/logo0.sh | bash
echo ""
echo "Перед тем как хапускать ножу авторизоваться от пользователя root"
echo ""
echo ""
echo "----------------------------------------------------------------------------------------------------"
echo "Перед запуском нужно сходить на эти сайты (там нужно заклеймить токены и сделать стейк): "
echo ""
echo -e "\e[0;32mЗапроси кран https://faucet.quicknode.com/drip\e[0m"
echo ""
echo -e "\e[0;32mДальше иди на сайта https://testnet-3.elixir.xyz/ там нужно запросить токены заплатив тестовыми токенами которые запрашивали раньше\e[0m"
echo "----------------------------------------------------------------------------------------------------"

sleep 15

apt install docker.io -y
echo ""
echo "----------------------------------------------------------------------------------------------------"
read -p "Введи адрес кошелька: " address
read -p "Введи приватный ключ: " private_key
read -p "Введи имя ноды: " validator_name
echo "----------------------------------------------------------------------------------------------------"

cat <<EOF > validator.env
ENV=testnet-3

# Allowed characters A-Z, a-z, 0-9, _, -, and space
STRATEGY_EXECUTOR_DISPLAY_NAME=$validator_name
STRATEGY_EXECUTOR_BENEFICIARY=$address
SIGNER_PRIVATE_KEY=$private_key
EOF

echo ""
echo "----------------------------------------------------------------------------------------------------"
echo "validator.env Создан с вводными данными"
echo ""
echo "----------------------------------------------------------------------------------------------------"
echo "Скачивание образов"
echo "----------------------------------------------------------------------------------------------------"
docker pull elixirprotocol/validator:v3
echo "----------------------------------------------------------------------------------------------------"
echo "Билд ноды"
echo ""
docker run -d --env-file /root/validator.env --name elixir --restart unless-stopped elixirprotocol/validator:v3
echo ""
echo "----------------------------------------------------------------------------------------------------"
echo "Запуск ноды"
docker run -d --restart unless-stopped --name ev elixir-validator



echo "Введи команду <' docker logs -f ev '> и проверь логи"


echo "Полезные команды:"
echo -e "\e[0;32mЛоги - docker logs -f ev\e[0m"
