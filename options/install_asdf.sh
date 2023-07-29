install_asdf() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

    # Para bash
    echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
    echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
    source ~/.bashrc

    # Para zsh
    if which zsh > /dev/null; then
        echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
        echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.zshrc
        source ~/.zshrc
    fi

    export TERM=xterm-color

    # Armazena a saída do comando dialog em uma variável
    opcoes=$(dialog --colors --stdout --separate-output \
    --title "" \
    --checklist "Adicionar plugins do ASDF:" 0 0 0 \
    1 "Node JS - 18.16.1" on \
    2 "Node JS - 16.20.1" on \
    3 "Node JS - 14.21.3" on \
    4 "Python - 3.11.4" on \
    5 "Python - 2.7.18" on \
    6 "PHP - 8.2.8" on \
    7 "PHP - 7.4.30" on \
    )

    # Verifica se o usuário pressionou Esc ou Cancelar
    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
        clear
        echo "Operação cancelada pelo usuário."
        exit 1
    fi

    # Processa as opções selecionadas pelo usuário
    for opcao in $opcoes; do
        case $opcao in
            1)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 18.16.1
                ;;
        2)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 16.20.1
                ;;
        3)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 14.21.3
                ;;                        
            4)
                echo "Instalando plugin de Python..."
                
                sudo apt update -y
                sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

                asdf plugin add python https://github.com/danhper/asdf-python.git
                
                asdf install python 3.11.4
                ;;
            5)
                echo "Instalando plugin de Python..."
                
                sudo apt update -y
                sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

                asdf plugin add python https://github.com/danhper/asdf-python.git
            
                asdf install python 2.7.18
                ;;

            6)
                echo "Instalando plugin de PHP..."

                sudo apt update -y
                sudo apt install -y autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev

                asdf plugin add php https://github.com/asdf-community/asdf-php.git
                asdf install php 8.2.8
                ;;
            7)
                echo "Instalando plugin de PHP..."

                sudo apt update -y
                sudo apt install -y libssl-dev autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev

                asdf plugin add php https://github.com/asdf-community/asdf-php.git
                asdf install php 7.4.30
                ;;
        esac
    done
}
