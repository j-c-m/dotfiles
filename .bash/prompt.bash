case $TERM in
    xterm* | screen* )
        TITLEBAR="\[\e]2;\u@\h: \w\a\]"
        ;;
    *)
        TITLEBAR=""
        ;;
esac

if [[ $EUID -eq 0 ]]; then
    UCOLOR="\e[31m"
else
    UCOLOR="\e[37m"
fi

PS1="${TITLEBAR}[\[\e[1;37m\]\t\\[\e[m\]] \d [\[\e[44m\e[1;36m\]\w\$(git_echo_prompt)\[\e[m\]]:\[\e[44m${UCOLOR}\]\u@\h\[\e[m\]\n\$ "

GIT_PROMPT_PREFIX=":"
GIT_PROMPT_SUFFIX=
GIT_PROMPT_DIRTY="\e[m\e[44m\e[31m*"
GIT_PROMPT_CLEAN=
