#!/bin/bash

################################################################################
##
## OS tested: KDE neon, Debian testing
##
## ToDo:
## - Add arguments for the options:
## 
##
################################################################################

######## Colores y estilo
red_t=$(tput setaf 1)
green_t=$(tput setaf 2)
orange_t=$(tput setaf 3)
blue_t=$(tput setaf 27)
purple_t=$(tput setaf 5)
white_t=$(tput setaf 7)
grey_t=$(tput setaf 8)
darkred_t=$(tput setaf 9)
yellow_t=$(tput setaf 11)
black_t=$(tput setaf 16)
darkyellow_t=$(tput setaf 155)

red_b=$(tput setab 1)
green_b=$(tput setab 2)
yellow_b=(tput setab)
orange_b=(tput setab)
brown_b=(tput setab)
grey_b=(tput setab)

bold=$(tput bold)
uline=$(tput smul)
rst=$(tput sgr0)

line="================================================================================"
inf_s="${bold} [${green_t}+${rst}${bold}]${rst} "
qst_s="${bold} [${yellow_t}?${rst}${bold}]${rst} "
err_s="${bold} [${red_t}x${rst}${bold}]${rst} "

######## Variables


######## Funciones

pausa(){
  read -p "${qst_s} Presiona ${bold}${darkyellow_t}ENTER${rst} para continuar..." fackEnterKey
}

prev_checks(){
  # Devuelve 0 si es correcto y 1 si hay errores de dependencias y 2 si hay
  # errores de conexión a Internet

  #chk_deps
  chk_connection
}

#chk_deps(){
#
#}

chk_connection(){
  # Comprueba que hay conexión a Internet
  clear

  url="www.google.es"
  count=3

  printf "${blue_t}"
  printf "\n ===================== "
  printf "\n #   ${rst}${darkyellow_t}${bold}C A L I B R E${rst}${blue_t}   # "
  printf "\n #   ${rst}${darkyellow_t}${bold}M A N A G E R${rst}${blue_t}   # "
  printf "\n ===================== "
  printf "\n ====================================== ${rst}\n"

  printf "${inf_s} ${purple_t}${bold}CHECKS${rst} previos...\n"
  printf "${inf_s} Probando la conexión..."

  if (ping -c ${count} "${url}" 1> /dev/null); then
    message="\n${inf_s} Internet Connection ${purple_t}${bold}STATUS${rst}: ${green_b}${black_t} OK ${rst}\n"
    printf "${message}"
    pausa
  else
    message="\n${err_s} Internet Connection ${purple_t}${bold}STATUS${rst}: ${red_b}${black_t} KO ${rst}\n"
    printf "${message}"
    exit
  fi
}

show_menu_principal(){
  clear
  printf "${blue_t}"
  printf "\n ===================== "
  printf "\n #   ${rst}${darkyellow_t}${bold}C A L I B R E${rst}${blue_t}   # "
  printf "\n #   ${rst}${darkyellow_t}${bold}M A N A G E R${rst}${blue_t}   # "
  printf "\n ===================== "
  printf "\n =============================================================== ${rst}"
  printf "\n ${darkyellow_t}${bold}1)${rst} Actualizar Calibre."
  printf "\n ${darkyellow_t}${bold}2)${rst} Instalar Calibre en directorio por defecto (recomendado)."
  printf "\n ${darkyellow_t}${bold}3)${rst} Instalar Calibre en un directorio determinado."
  printf "\n ${darkyellow_t}${bold}4)${rst} Salir. "
  printf "\n ${blue_t}===============================================================${rst} \n"
  read -p "${qst_s}Escoja una opción (1-4): " user_op
  printf "${inf_s}Has elegido la opción ${bold}${blue_t}${user_op}${rst}" && sleep 2

  case ${user_op} in
    1) actualiza
       show_menu_principal
       ;;
    2) instala
       show_menu_principal
       ;;
    3) instala_custom_dir
       show_menu_principal
       ;;
    4) printf "\n${inf_s}Saliendo del script ${bold}${darkyellow_t}Calibre Manager${rst}...\n\n" && sleep 2
       exit
       ;;
    *) printf "\n${err_s}Error... Opción ${darkred_t}${user_op}${rst} no válida, escoja una opción (1-4)\n${err_s}Volviendo al menú principal..." && sleep 4 && show_menu_principal
  esac
}

actualiza(){
  # Actualiza Calibre
  printf "\n${inf_s}Actualizando Calibre...\n\n" && sleep 1
  sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin && \
  printf "\n${inf_s}Actualización completa. \n\n"
}

instala(){
  # Instala Calibre
  printf "\n${inf_s}Instalando Calibre...\n\n"
  sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin && \
  printf "\n${inf_s}Instalación completada con éxito. \n\n"
}

instala_custom_dir(){
  # Instala Calibre en un directorio específico
  read -p "\n${qst_s}Introduce la ruta completa del directorio de instalación: " dir_to_install
  printf "\n${inf_s}Has escogido el directorio de instalación ${dir_to_install}" && sleep 2
  printf "\n${inf_s}Comenzando la instalación de Calibre en ${dir_to_install}..."
  sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin install_dir=${dir_to_install} && \
  printf "\n${inf_s}Calibre instalado correctamente"
}

################ INICIO DEL SCRIPT ################
prev_checks
show_menu_principal
