#!/bin/bash

echo "*****************************************************************************"
echo "Установить зависимости? Введите 1 для 'Да' или 2 для 'Нет':"
read INSTALL_DEPENDENCIES

if [ "$INSTALL_DEPENDENCIES" -eq 1 ]; then
    echo "*****************************************************************************"
    echo "Устанавливаем зависимости"
    echo "*****************************************************************************"

    curl -s https://raw.githubusercontent.com/DenisHumen/Logo/refs/heads/main/logo0.sh | bash
    curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh | bash
    curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/ufw.sh | bash
    curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/rust.sh | bash
    source $HOME/.profile
    source "$HOME/.cargo/env"
    curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/refs/heads/main/foundry.sh | bash
    source $HOME/.profile

    echo "*****************************************************************************"
    echo "Качаем проект."
    echo "*****************************************************************************"

    cd $HOME
    #git clone https://github.com/yetanotherco/aligned_layer.git && cd aligned_layer

    echo "*****************************************************************************"
    echo "Устанавливаем дополнительные зависимости и проходим квиз. Ответы(Nakamoto, Pacific, Green)."
    echo "*****************************************************************************"
fi


echo "Хотите добавить кошелек? Введите 1 для 'Да' или 2 для 'Нет':"
read ADD_WALLET

if [ "$ADD_WALLET" -eq 1 ]; then
    source $HOME/.profile
    /root/.foundry/bin/cast wallet import --interactive wallet
else
    echo "Кошелек не добавлен."
fi



echo "Есть ли баланс 0.004 ETH? Введите 1 для 'Да' или 2 для 'Нет':"
read CHOICE

if [ "$CHOICE" -eq 1 ]; then
    source /root/.bashrc
    cd "$HOME/aligned_layer/examples/zkquiz" || exit
    make answer_quiz KEYSTORE_PATH="$HOME/.foundry/keystores/wallet"
else
    echo "Вы выбрали 'Нет'."
fi

echo "-----------------------------------------------------------------------------"
echo "Удаляем все данные после деплоя. Введите 1 для 'Да' или 2 для 'Нет':"
read DELETE_FILES

if [ "$DELETE_FILES" -eq 1 ]; then
    cd $HOME
    rm -rf $HOME/aligned_layer
    rm -rf $HOME/.foundry/keystores/wallet
    echo "Все данные удалены."
else
    echo "Данные не удалены."
fi

echo "-----------------------------------------------------------------------------"
echo "Wish lifechange case with DOUBLETOP"
echo "-----------------------------------------------------------------------------"
