#!/bin/bash

source basic/menu.sh
source basic/basic_steps.sh

install_init_dependencies

opcoes=$(get_options)

for opcao in $opcoes; do
    case $opcao in
        1)
            source options/install_zsh.sh
            install_zsh
            ;;
        2)
            source options/create_new_user.sh
            create_new_user
            ;;    
        3)
            source options/install_ssh_server.sh
            intall_ssh_server
            ;;
        4)
            source options/install_ssh_server.sh
            activate_root_ssh
            ;;  
        5)
            source options/install_docker.sh
            install_docker
            ;;
        6)
            install_speed_test
            ;;
        7)
            install_vim
            ;;
        8)
            install_git
            ;;
        9)
            install_htop
            ;;
        10)
            install_nettools
            ;;
        11)
            install_neofetch
            ;;
        12)
            install_bashtop
            ;;
        13)
            install_ncdu
            ;;
        14)
            source options/install_asdf.sh
            install_asdf
            ;;
        15)
            source options/install_docker.sh
            run_without_sudo
            ;;

    esac
done

clear

show_ips

echo "Operação concluída."