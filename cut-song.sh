#!/bin/bash

# Cambiar para pedir los datos y luego procesarlo con alguna funcion que
# segun la extension del archivo realice una acion u otra.
#
################################################################################

# VARIABLES
INPUT_FILE=$1
START_TIME=$2    # 00:00:00
END_TIME=$3      # 00:00:00
OUTPUT_FILE=$4

USAGE="./cut-song.sh [input.mp3] [startchop] [stopchop] [output.mp3]"

# FUNCIONES
show_help() {
  printf "${USAGE}\n"
}

request_data(){

printf "\n"
printf "\n"
printf "\n"

}

get_extension() {

}

cut_song() {

printf "Cortando el archivo de audio...\n"

}

printf "\n\n${USAGE}\n\n"

printf "\nCortando ${INPUT_FILE} empezando en $START_TIME hasta $END_TIME \n"

ffmpeg -i ${INPUT_FILE} -ss ${START_TIME} -to ${END_TIME} -c copy ${OUTPUT_FILE}
