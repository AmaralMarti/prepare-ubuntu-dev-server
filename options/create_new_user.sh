create_new_user() {
    username=""
    while [ -z "$username" ]; do
        dialog --title "Criando um novo usuario" --inputbox "Digite o nome do usuario:" 8 80 2>ans.txt
        ret=$?

        if [ $ret -eq 1 ] || [ $ret -eq 255 ]; then
            dialog --yesno 'Deseja mesmo cancelar?' 0 0 ;
            ret=$?
            if [ $ret -eq 0 ]; then
                clear
                echo "Operação cancelada pelo usuário."
                exit 1
            fi
        else 
            username=$(<ans.txt)

            if [ -z "$username" ]; then
                dialog --title "Erro" --msgbox "O nome do usuario nao pode ser vazio." 5 80
            else
                user_exists $username

                if [ $? -eq 0 ]; then
                    dialog --msgbox "O usuario \"$username\" ja existe no sistema." 5 80
                    username=""
                fi
            fi
        fi
    done

    password=""
    confirm=""
    
    while [ -z "$password" ] || [ "$password" != "$confirm" ]; do
        dialog --title "Criando um novo usuario" --insecure --passwordbox "Digite a senha do usuario:" 8 80 2>ans.txt
        ret=$?

        if [ $ret -eq 1 ] || [ $ret -eq 255 ]; then
            dialog --yesno 'Deseja mesmo cancelar?' 0 0 ;
            ret=$?
            if [ $ret -eq 0 ]; then
                clear
                echo "Operação cancelada pelo usuário."
                exit 1
            fi
        else 
            password=$(<ans.txt)

            if [ -z "$password" ]; then
                dialog --title "Erro" --msgbox "A senha nao pode ser vazia." 5 80
            else
                dialog --title "Criando um novo usuario" --insecure --passwordbox "Confirme a senha do usuario:" 8 80 2>ans.txt
                ret=$?

                if [ $ret -eq 1 ] || [ $ret -eq 255 ]; then
                    dialog --yesno 'Deseja mesmo cancelar?' 0 0 ;
                    ret=$?
                    if [ $ret -eq 0 ]; then
                        clear
                        echo "Operação cancelada pelo usuário."
                        exit 1
                    fi
                else 
                    confirm=$(<ans.txt)

                    if [ "$password" != "$confirm" ]; then
                        dialog --title "Erro" --msgbox "As senhas nao correspondem." 5 80
                    fi                    
                fi
            fi
        fi
    done

    rm -f ans.txt

    useradd -m -p $(openssl passwd -1 $password) $username            
    sudo adduser $username sudo
    
    sudo -u $username ssh-keygen -t rsa -b 2048 -N "" -f /home/$username/.ssh/id_rsa

    if which zsh > /dev/null; then
        cp ~/.zshrc /home/$username/
        cp -R ~/.oh-my-zsh /home/$username/

        chown $username:$username /home/$username/.zshrc
        chown $username:$username -R /home/$username/.oh-my-zsh

        sudo usermod -s /usr/bin/zsh $username
    fi
}