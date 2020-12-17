#!/usr/bin/env bash

BRIGHT=$(xbacklight -get)

if [[ $? -eq 0 ]];then
    echo "$BRIGHT"
else
    echo "?"
fi