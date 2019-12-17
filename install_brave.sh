#!/bin/bash

# Last rev.: 12/12/2019

# Instalar dependencis necesarias
sudo apt -y install apt-transport-https curl
# Descargamos la clave y la añadimos a nustro anillo
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
# Añadimos los repositrios
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# Actualizar los repositorios
sudo apt update && \
# Instalar Brave
sudo apt -y install brave-browser
