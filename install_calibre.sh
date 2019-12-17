#!/bin/bash

#
# Calibre v4.6.0
#
#########################


# Instalar o actualizar Calibre
#sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Si aparece ERROR sobre certificado raíz
#sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Instalar especificando directorio de instalación, en este caso /opt
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin install_dir=/opt

# Instalar versión específica de Calibre, en este caso v3.48.0
#sudo -v && sudo calibre-uninstall && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin version=3.48.0

#
