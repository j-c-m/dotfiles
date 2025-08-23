#!/bin/bash
if [[ -n $ZSH_VERSION && ( $TERM == "alacritty" || $TERM == xterm-* ) ]]; then
    echotc Co &> /dev/null || export TERM=xterm-256color
    return 0
fi

if [[ $TERM == "alacritty" || $TERM == xterm-* ]]; then
    infocmp &> /dev/null || export TERM=xterm-256color
fi
