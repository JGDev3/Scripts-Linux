#!/bin/bash

cd Descargas
# Descargamos el archivo comprimido
wget https://telegram.org/dl/desktop/linux --output-document=tsetup.tar.xz
# Extraemos los archivos
tar -xvf tsetup.tar.xz
# Movemos el directorio extraído a ~/Tools y eliminamos el paquete cmprimido
mv Telegram /home/jorge/Tools && \
rm -rf tsetup.tar.xz
# Ejecutamos Telegram para configurarlo
cd ~/Tools/Telegram && \
./Telegram &
