#!/bin/bash

while true
do
    clear

    echo "=============================="
    echo "        MENU SISTEMA"
    echo "=============================="
    echo "1  - Atualizar sistema"
    echo "2  - Ver espaço em disco"
    echo "3  - Ver memória RAM"
    echo "4  - Ver CPU"
    echo "5  - Ver tempo ligado"
    echo "6  - Verificar internet"
    echo "7  - Usuários logados"
    echo "8  - Fazer backup"
    echo "9  - Limpar cache"
    echo "10 - Ver logs do sistema"
    echo "11 - Ver serviços ativos"
    echo "12 - Sair"
    echo "=============================="

    read -p "Escolha uma opção: " opcao

    echo

    case $opcao in

        1)
            echo "Atualizando sistema..."
            sudo apt update
            sudo apt upgrade -y
            ;;

        2)
            echo "Espaço em disco:"
            df -h
            ;;

        3)
            echo "Memória RAM:"
            free -h
            ;;

        4)
            echo "Informações da CPU:"
            lscpu
            ;;

        5)
            echo "Tempo ligado:"
            uptime
            ;;

        6)
            echo "Testando conexão..."
            ping -c 4 google.com
            ;;

        7)
            echo "Usuários logados:"
            who
            ;;

        8)
            echo "Criando backup da pasta HOME..."

            mkdir -p backup

            tar -czf backup/home_backup.tar.gz $HOME

            echo "Backup criado em ./backup"
            ;;

        9)
            echo "Limpando cache..."
            sudo apt clean
            ;;

        10)
            echo "Últimos logs do sistema:"
            journalctl -n 20
            ;;

        11)
            echo "Serviços ativos:"
            systemctl list-units --type=service --state=running
            ;;

        12)
            echo "Saindo..."
            break
            ;;

        *)
            echo "Opção inválida."
            ;;

    esac

    echo
    read -p "Pressione ENTER para continuar..."

done
