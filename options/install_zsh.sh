install_zsh() {
    echo "Instalando ZSH com Oh My Zsh..."
    apt install -y git zsh
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="bira"/g' ~/.zshrc
    echo "alias ll='ls -la'" >> ~/.zshrc
    sudo usermod -s /usr/bin/zsh $USER
    source ~/.zshrc    
}