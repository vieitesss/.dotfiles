#!/bin/bash

chests=( "giant" "epic" "magical" "legendary" "royalwild" "megalightning" )

curl -s https://royaleapi.com/player/2PRLCVGC > cr.tmp

# all_data=()
# grep -E "chest giant|epic|magical|legendary|royalwild|megalightning" -A 6 | grep -vE "img|tr|td|h5"

for chest in "${chests[@]}"
do
    data=$(grep "chest $chest" -A 6 cr.tmp | awk -F"[<>]" '{print $1}' | sort)
    # all_data+=("$data")
    chests_left=$(echo $data | awk '{print $1 " " $2}')
    time_to_unlock=$(echo $data | awk '{for(i=3;i<=NF;i++) total = total " " $i; print total}')
    
    dunstify -a "cr" -i $chest "Chests left: $chests_left" "Time to unlock: $time_to_unlock"
done

# printed_data=""
# for data in "${all_data[@]}"
# do
#     # echo $data
#     printed_data+="$(echo "$data" | xargs)"
# done

# echo $printed_data

rm cr.tmp
