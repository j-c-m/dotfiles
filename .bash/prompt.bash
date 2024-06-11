case $TERM in
    cygwin|xterm*|putty*|rxvt*|ansi|alacritty|tmux*|screen*)
        TITLEBAR="\[\e]2;\u@\h: \w\a\]"
        ;;
    *)
        TITLEBAR=""
        ;;
esac

if [[ $EUID -eq 0 ]]; then
    UCOLOR="\e[1;31m"
else
    UCOLOR="\e[1;37m"
fi

if [[ -n "$BASE16_THEME" ]]; then
    PS1="${TITLEBAR}[\[\e[1;37m\]\t\\[\e[m\]] \d [\[\e[48;5;19m\e[1;36m\]\w\$(git_echo_prompt)\[\e[m\]]:\[\e[48;5;12m${UCOLOR}\]\u@\h\[\e[m\]\n\$ "
else
    PS1="${TITLEBAR}[\[\e[1;37m\]\t\\[\e[m\]] \d [\[\e[44m\e[1;36m\]\w\$(git_echo_prompt)\[\e[m\]]:\[\e[44m${UCOLOR}\]\u@\h\[\e[m\]\n\$ "
fi

GIT_PROMPT_PREFIX=":"
GIT_PROMPT_SUFFIX=
GIT_PROMPT_DIRTY="\e[31m*"
GIT_PROMPT_CLEAN=
