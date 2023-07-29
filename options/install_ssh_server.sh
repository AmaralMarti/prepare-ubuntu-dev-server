intall_ssh_server() {
    echo "Instalando e habilitando servidor SSH..."
    sudo apt install -y openssh-server
    sudo systemctl enable sshd
    sudo systemctl start sshd    
}

activate_root_ssh() {
    echo "Ativando acesso SSH como root..."
    sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sudo systemctl restart sshd
}