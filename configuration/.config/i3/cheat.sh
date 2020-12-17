#!/bin/bash

#cd ~/Scripts

if [ -f "keys.txt" ]; then
    rm keys.txt
fi

regex='(#.*)bind(code|sym)\s(\S*)\s(.*)'

if [ -f ~/.config/i3/config ];then
    cat ~/.config/i3/config | sed ':a;N;$ba;s/\(#.*\)\n/\1 /g' | \
    while read CMD; do
        if [[ $CMD =~ $regex ]]
        then
            if [[ ${BASH_REMATCH[0]} ]]
            then
                match="${BASH_REMATCH[0]}"
                commentary=`echo "${BASH_REMATCH[1]}" | awk '{$1=$1};1'`
                bind=`echo "${BASH_REMATCH[3]}" | awk '{$1=$1};1'`
                printf "%-40s" "$commentary" "$bind" >> keys.txt
                printf "\n" >> keys.txt
            fi
        fi
    done

    #font="Inconsolata-Regular"
    font="monofur"
    font_size=20
    font_color="#d8dee9"
    bordercolor="#3b4252"
    #bordercolor="#4c566a"
    background_color="#3b4252"

    convert -size 1000x3000 xc:$background_color -font $font -pointsize $font_size -fill $font_color \
    -annotate +20+20 @keys.txt -trim -bordercolor $bordercolor -border 20 +repage keys.png
    #convert -size 2000x2000 xc:"#204B6F" -font "Inconsolata-Regular" -pointsize 18 -fill "#FFD700" \
    #-annotate +20+20 @keys.txt -trim -bordercolor "#204B6F" -border 20 +repage keys.png

    feh --no-menus --title "cheat" keys.png

    rm keys.png
fi
