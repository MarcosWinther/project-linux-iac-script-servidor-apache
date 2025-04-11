#!/bin/bash

echo "🔄 Atualizando servidor..."
apt-get update
apt-get upgrade -y

echo "🌐 Instalando Apache2..."
apt-get install apache2 -y

echo "📦 Instalando unzip..."
apt-get install unzip -y

echo "📥 Baixando e 🚀 copiando os arquivos da aplicação..."

# Navega para o diretório temporário
cd /tmp

# Baixa o arquivo zip da aplicação
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompacta o arquivo
unzip main.zip

# Navega para o diretório da aplicação descompactado
cd linux-site-dio-main

# Copia todo o conteúdo para o diretório raiz do Apache
# A flag -R garante a cópia de diretórios e seus conteúdos
cp -R * /var/www/html/

echo "🎉 Processo concluído! Servidor Apache configurado e site no ar!"
