if type -p less &> /dev/null; then
    export PAGER=less
    export LESS=FRX
elif type -p more &> /dev/null; then
    export PAGER=more
fi
