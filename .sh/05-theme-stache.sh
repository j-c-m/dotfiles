THEME_STACHE="${HOME}/.config/theme-stache"         # Directory for theme-stache
DEFAULT_THEME="iterm-spacegray-eighties"            # Default theme name
SHELL_THEME="${HOME}/.shell_theme.sh"               # Path to shell theme symlink
THEME_STACHE_BIN="${HOME}/bin/theme-stache"         # Path to theme-stache binary symlink

if [[ ! -f $SHELL_THEME ]]; then
    ln -sf "${THEME_STACHE}/build/shell/${DEFAULT_THEME}.sh" "$SHELL_THEME"
fi

if [[ ! -f $THEME_STACHE_BIN ]]; then
    mkdir -p "${HOME}/bin"
    ln -sf "${THEME_STACHE}/theme-stache.py" "$THEME_STACHE_BIN"
fi

if [[ -f $SHELL_THEME ]]; then
    source "$SHELL_THEME"
fi

unset THEME_STACHE DEFAULT_THEME SHELL_THEME THEME_STACHE_BIN
