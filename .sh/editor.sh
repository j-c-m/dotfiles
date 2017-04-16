if type -p vim &> /dev/null; then
    export EDITOR=vim
elif type -p ee &> /dev/null; then
    export EDITOR=ee
fi
