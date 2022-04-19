#!/bin/bash

DIR="/tmp/cr"
FILE="${DIR}/cr.tmp"
ID="${DIR}/id"
DEFAULT_ID="2PRLCVGC"

mkdir -p $DIR > /dev/null

if [[ -n $1 || ! -s $ID ]]; then
    new_id=$(zenity --entry --text "Enter your CR ID:" | xargs)
    if [[ "${#new_id}" -eq "8" ]]; then
        echo "$new_id" > "$ID"
    else
        dunstify -u critical -i warning -t 5000 "The ID is not valid"
        exit 0
    fi
fi

dunstify "Searching data..."

curl -s https://royaleapi.com/player/$(cat $ID) > $FILE

name=$(cat $FILE | grep "class=\"p_header_container" -A 3 | tail -n 1)

if [ ! -s $FILE ]; then
    dunstctl close-all
    dunstify -u critical -i warning -t 5000 "There was a problem"
    exit 0
fi

data=$(cat $FILE | grep -E "chest giant|epic|magical|legendary|royalwild|megalightning" -A 6 | grep -vE "img|tr|td|h5")
sorted_chests=$(echo $data | awk '{for(I=1;I<NF;I++) if ($I == "class=\"chest") printf "%s ",$(I+1)}' | sed 's/\">//g')
chest_number=$(echo $data | awk '{for(I=1;I<NF;I++) if ($I ~ /basic|violet../) printf "%s%s ",$(I+1),$(I+2)}')
chest_data=$(echo $data | awk '{for(I=1;I<NF;I++){ if ($I ~ /[0-9]+[wdh]/){ printf "%s",$I; if ($I ~ /[0-9]+h/) printf "\n" }}}')

chests_arr=( $sorted_chests )
number_arr=( $chest_number )
time_arr=( $chest_data )

dunstctl close-all

dunstify -a "cr" -i cr "$name"
for ((i = 0; i < ${#chests_arr[@]}; i++)); do
    dunstify -a "cr" -i ${chests_arr[i]} "Chests left: ${number_arr[i]}" "Time to unlock: ${time_arr[i]}"
done

rm $FILE
