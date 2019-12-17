#!/bin/bash

##
## Script para instalar el editor de textos Atom
##
################################################################################

# Iral directorio de Descargas.
cd Descargas
# Descargamos el instalador y le damos nombre al archivo descargado.
#wget https://atom.io/download/deb -O atom-amd64.deb  && \                      # Modo corto
wget https://atom.io/download/deb --output-document=atom-amd64.deb && \
# Instalamos el programa
sudo dpkg -i atom-amd64.deb && \
# Instalamos las dependencias que faltan
sudo apt install -f -y && \
# Movemos el instalador a su carpeta
mv atom-amd64.deb Instaladores/
# Mensaje
printf "\n\n [+] Atom instalado correctamente\n\n"
