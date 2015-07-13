if type -p less &> /dev/null
then
    export PAGER=less
    export PAGER=less
    export LESS=-RXE
elif type -p more &> /dev/null
then
    export PAGER=more
    export PAGER=more
fi
