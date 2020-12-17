#!/usr/bin/env bash

I3CONF="/home/shivanshu2/.config/i3"
KEYS="$I3CONF/my_keys.txt"
LOG=/tmp/cheats.txt


if [ -f "$KEYS" ];then
    awk '{first = $1; $1 = ""; print "$->" $0}' $KEYS > $I3CONF/my_keys_com.txt

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: awk failed to create $I3CONF/my_keys_com.txt\n" >> LOG
        exit
    fi

    awk '{print $1}' $KEYS > $I3CONF/my_keys_key.txt

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: awk failed to create $I3CONF/my_keys_key.txt\n" >> LOG
        exit
    fi

    font="monofur"
    font_size=23
    font_color="#d8dee9"
    font_color2="#d08770"
    bordercolor="#2e3440"
    background_color="#2e3440"

    # making keys png
    convert -size 1000x3000 xc:$background_color -font $font -pointsize $font_size -fill $font_color2 -annotate +20+20 @$I3CONF/my_keys_key.txt -trim -bordercolor $bordercolor -border 20 +repage $I3CONF/my_keys_key.png

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: convert failed to create $I3CONF/my_keys_key.png\n" >> LOG
        exit
    fi

    # making description png
    convert -size 1000x3000 xc:$background_color -font $font -pointsize $font_size -fill $font_color -annotate +20+20 @$I3CONF/my_keys_com.txt -trim -bordercolor $bordercolor -border 20 +repage $I3CONF/my_keys_com.png

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: convert failed to create $I3CONF/my_keys_com.png\n" >> LOG
        exit
    fi

    # combining those two
    convert $I3CONF/my_keys_com.png $I3CONF/my_keys_key.png +append $I3CONF/my_keys.png

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: convert failed to create $I3CONF/my_keys.png\n" >> LOG
        exit
    fi

    # display with feh
    feh -x --no-menus --on-last-slide quit --title "cheat" $I3CONF/my_keys.png

    if [[ $? -ne 0 ]]; then
        echo -e "ERROR: feh failed to display $I3CONF/my_keys.png\n" >> LOG
        exit
    fi

    # remove all files
    # rm $I3CONF/my_keys_key.txt $I3CONF/my_keys_key.png
    # rm $I3CONF/my_keys_com.txt $I3CONF/my_keys_com.png
    # rm $I3CONF/my_keys.png
else
    echo -e "ERROR: $KEYS does not exists\n" >> LOG
    exit 1
fi
