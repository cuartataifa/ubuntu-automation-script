#!/bin/bash

# Atualização e melhoria da lista de pacotes
echo "Atualizando e melhorando a lista de pacotes..."
sudo apt update && sudo apt upgrade -y

# Pré-configuração para codecs e instalação de ubuntu-restricted-extras
echo "Pré-configurando codecs..."
sudo apt install -y debconf-utils
echo "ubuntu-restricted-extras shared/accepted-flash-license boolean true" | sudo debconf-set-selections

# Instalação de codecs essenciais de áudio e vídeo
echo "Instalando codecs essenciais..."
sudo apt install -y ubuntu-restricted-extras libavcodec-extra ffmpeg

# Instalação e configuração do firewall UFW
echo "Instalando e configurando o firewall UFW..."
sudo apt install -y ufw
sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Instalação de ferramentas de rede
echo "Instalando ferramentas de rede..."
sudo apt install -y net-tools nmap traceroute curl wget

# Instalação de utilitários do sistema
echo "Instalando utilitários essenciais..."
sudo apt install -y git build-essential htop neofetch tree

# Instalação de ferramentas de desenvolvimento
echo "Instalando ferramentas de desenvolvimento..."
sudo apt install -y python3 python3-pip python3-venv openjdk-11-jdk nodejs npm

# Instalação de editores de texto e Visual Studio Code
echo "Instalando editores de texto..."
sudo apt install -y vim nano
echo "Instalando Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install -y code

# Instalação de fontes adicionais
echo "Instalando fontes adicionais..."
sudo apt install -y fonts-ubuntu fonts-dejavu fonts-freefont-ttf

# Instalação de ferramentas de compressão e descompressão
echo "Instalando ferramentas de compressão..."
sudo apt install -y zip unzip tar p7zip-full rar unrar

# Instalação de suporte a NTFS e exFAT
echo "Instalando suporte ao sistema de arquivos NTFS e exFAT..."
sudo apt install -y ntfs-3g exfat-fuse exfat-utils

# Instalação do GParted
echo "Instalando o GParted..."
sudo apt install -y gparted

# Instalação do Synaptic
echo "Instalando o Synaptic..."
sudo apt install -y synaptic

# Limpeza do sistema
echo "Limpando pacotes desnecessários..."
sudo apt autoremove -y && sudo apt autoclean -y

echo "Instalação de pacotes essenciais e utilitários concluída com sucesso!"

