THEME_STACHE="${HOME}/.config/theme-stache"
DEFAULT_THEME="iterm-spacegray-eighties"

if [ ! -f "${HOME}/.shell_theme.sh" ]; then
    ln -s "${THEME_STACHE}/build/shell/${DEFAULT_THEME}.sh" "${HOME}/.shell_theme.sh"
fi

if [ ! -f "${HOME}/bin/theme-stache" ]; then
    ln -s "${THEME_STACHE}/theme-stache.py" "${HOME}/bin/theme-stache"
fi

source "${HOME}/.shell_theme.sh"

unset THEME_STACHE
unset DEFAULT_THEME
