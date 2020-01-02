#!/bin/bash


######## Colores y estilo
red_t=$(tput setaf 1)
green_t=$(tput setaf 2)
yellow_t=$(tput setaf 3)
darkyellow_t=$(tput setaf 155)
blue_t=$(tput setaf 27)
pink_t=$(tput setaf 5)
white_t=$(tput setaf 7)

bold=$(tput bold)
uline=$(tput smul)
rst=$(tput sgr0)

inf_s="${bold} [${green_t}+${rst}${bold}]${rst} "
qst_s="${bold} [${yellow_t}?${rst}${bold}]${rst} "
err_s="${bold} [${red_t}x${rst}${bold}]${rst} "


menu(){
  clear
  printf "\n${blue_t}"
  printf "\n ========================= "
  printf "\n # ${darkyellow_t}${bold}    G R A F A N A ${blue_t}    # "
  printf "\n #   ${darkyellow_t}${bold}I N S T A L L E R${rst} ${blue_t}  # "
  printf "\n ========================= \n"
  printf "\n ================================ ${rst}"
  printf "\n ${darkyellow_t}${bold}1)${rst} Instalar Grafana STABLE."
  printf "\n ${darkyellow_t}${bold}2)${rst} Instalar Grafana BETA."
  printf "\n ${darkyellow_t}${bold}3)${rst} Salir."
  printf "\n ${blue_t}================================ ${rst}\n"
  read -p "${qst_s}Escoja una opción (1-3): " user_op
  printf "${inf_s}Has elegido la opción ${blue_t}${user_op}${rst}" && sleep 2

  case ${user_op} in
    1) inst_deps
       set_stable_repo
       install_grafana
       menu
       ;;
    2) inst_deps
       set_beta_repo
       install_grafana
       menu
       ;;
    3) printf "\n${inf_s}Saliendo del script Grafana installer...\n\n" && sleep 2
       exit
       ;;
    *) printf "\n${err_s}Error... Opción ${bold}${red_t}${user_op}${rst} no válida, escoja una opción (1-3)\n${err_s}Volviendo al menú principal..." && sleep 4 && menu
  esac
}

inst_deps(){
  sudo apt-get install -y apt-transport-https
  sudo apt-get install -y software-properties-common wget
}

set_stable_repo(){
  sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
  wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
}

set_beta_repo(){
  sudo add-apt-repository "deb https://packages.grafana.com/oss/deb beta main"
  wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
}

install_grafana(){
  sudo apt-get update
  sudo apt-get install grafana
}

menu
