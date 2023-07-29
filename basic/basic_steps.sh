install_init_dependencies() {
    echo "Atualizando o Ubuntu..."
    sudo apt update && sudo apt upgrade -y && apt install -y dialog wget curl network-manager
}

show_ips() {
    echo "Enderecos IP das interfaces de rede:"
    ip -4 -o addr show | grep -v ' lo\|docker' | awk '{print $2 ": " $4}'
}

install_speed_test() {
    curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
    sudo apt update && sudo apt install -y speedtest
}

install_vim() {
    echo "Instalando vim..."
    sudo apt install -y vim
}

install_git () {
    echo "Instalando git..."
    sudo apt install -y git
}

install_htop() {
    echo "Instalando htop..."
    sudo apt install -y htop
}

install_nettools() {
    echo "Instalando net-tools..."
    sudo apt install -y net-tools
}

install_neofetch() {
    echo "Instalando neofetch..."
    sudo apt install -y neofetch
}