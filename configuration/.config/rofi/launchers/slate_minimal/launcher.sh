#!/usr/bin/env bash


theme="slate_minimal_left"

dir="$HOME/.config/rofi/launchers/slate_minimal"
# styles=($(ls -p --hide="colors.rasi" $dir/styles))
# color="${styles[$(( $RANDOM % 10 ))]}"

# comment this line to disable random colors
# sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
# themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
# theme="${themes[$(( $RANDOM % 7 ))]}"

rofi -no-lazy-grab -show drun \
-modi drun,run,window,ssh \
-theme $dir/"$theme"