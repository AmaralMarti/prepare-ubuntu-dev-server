get_options() {
    export TERM=xterm-color

    # Armazena a saída do comando dialog em uma variável
    opcoes=$(dialog --colors --stdout --separate-output \
    --title "" \
    --checklist "Preparacao do Servidor Ubuntu 22.04 LTS:" 0 0 0 \
    1 "Instalar ZSH com Oh My Zsh" on \
    2 "Criar um usuario" on \
    3 "Instalar e habilitar servidor SSH" on \
    4 "Ativar acesso SSH como root" on \
    5 "Instalar Docker" on \
    6 "Instalar Speedtest by Ookla" on \
    7 "Instalar vim" on \
    8 "Instalar git" on \
    9 "Instalar htop" on \
    10 "Instalar net-tools" on \
    11 "Instalar neofetch" on \
    12 "Instalar bashtop" on \
    13 "Instalar ncdu" on \
    14 "Instalar ASDF para o USUARIO ATUAL" off \
    )

    # Verifica se o usuário pressionou Esc ou Cancelar
    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
        clear
        echo "Operação cancelada pelo usuário."
        exit 1
    fi

    echo $opcoes
}