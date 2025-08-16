THEME_STACHE="${HOME}/.config/theme-stache"         # Directory for theme-stache
DEFAULT_THEME="iterm-spacegray-eighties"            # Default theme name
THEME_STACHE_BIN="${HOME}/bin/theme-stache"         # Path to theme-stache binary symlink

autoload -U add-zsh-hook

if [[ ! -f ${HOME}/.shell_theme.sh ]]; then
    ln -sf "${THEME_STACHE}/build/shell/${DEFAULT_THEME}.sh" "${HOME}/.shell_theme.sh"
fi

if [[ ! -f $THEME_STACHE_BIN ]]; then
    mkdir -p "${HOME}/bin"
    ln -sf "${THEME_STACHE}/theme-stache.py" "$THEME_STACHE_BIN"
fi

function reset_theme() {
    [[ -f ${HOME}/.shell_theme.sh ]] && source "${HOME}/.shell_theme.sh"
}

function precmd_reset_theme() {
    local -a cmd_list=(ssh et mosh)
    local last_cmd_line=$(fc -ln -1)
    local last_cmd=${last_cmd_line[(w)1]}

    if [[ -n "$last_cmd" ]] && (( ${cmd_list[(Ie)$last_cmd]} )); then
        reset_theme
    fi
}

add-zsh-hook precmd precmd_reset_theme

alias reset="command reset && reset_theme"

reset_theme

unset THEME_STACHE DEFAULT_THEME THEME_STACHE_BIN
