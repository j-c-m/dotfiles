case $TERM in
    xterm* | screen* )
        TITLEBAR="\[\e]2;\u@\h: \w\a\]"
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="${TITLEBAR}[\[\e[1;34m\]\D{%F %T}\\[\e[m\]] \[\e[44m\e[1;36m\]\w\$(git_echo_prompt)\[\e[m\]:\[\e[44m\e[37m\]\u@\h\[\e[m\]\n\$ "

GIT_PROMPT_PREFIX=":"
GIT_PROMPT_SUFFIX=
GIT_PROMPT_DIRTY="\e[m\e[44m\e[31m*"
GIT_PROMPT_CLEAN=
