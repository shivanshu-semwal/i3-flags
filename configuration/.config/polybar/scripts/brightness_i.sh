#!/usr/bin/env bash

BRIG=$(xbacklight -get)

# symbols
ramp_0="" # for 0-30
ramp_1="" # for 30-60
# ramp_2=""
ramp_3="" # for 60-100
# ramp_4="

if [[ $BRIG -gt 100 ]];then
    echo "?"
elif [[ $BRIG -gt 60 ]];then
    echo $ramp_3
elif [[ $BRIG -gt 30 ]];then
    echo $ramp_1
elif [[ $BRIG -gt 0 ]];then
    echo $ramp_0
else
    echo "?"
fi