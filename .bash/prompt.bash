case $TERM in
    cygwin|xterm*|putty*|rxvt*|ansi|alacritty|tmux*|screen*)
        TITLEBAR="\[\e]2;\u@\h: \w\a\]"
        ;;
    *)
        TITLEBAR=""
        ;;
esac

if [[ $EUID -eq 0 ]]; then
    UCOLOR="\e[91m"
else
    UCOLOR="\e[97m"
fi

PS1="${TITLEBAR}[\[\e[97m\]\t\\[\e[m\]] \d [\[\e[0;36;100m\]\w\$(git_echo_prompt)\[\e[m\]]:\[${UCOLOR}\e[44m\]\u@\h\[\e[m\]\n\$ "

GIT_PROMPT_PREFIX=":"
GIT_PROMPT_SUFFIX=
GIT_PROMPT_DIRTY="\e[31m*"
GIT_PROMPT_CLEAN=
