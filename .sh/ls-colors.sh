export CLICOLOR=1

# Grok dumps this alias from a login shell, then sets GROK_AGENT=1 on
# replay. Source-time skip is not enough; _ls_lazy checks again.
[[ "${GROK_AGENT-}" == 1 ]] && return

alias ls='_ls_lazy'

_ls_lazy()
{
    if [[ "${GROK_AGENT-}" == 1 ]]; then
        command ls "$@"
        return
    fi
    if type -p colorls &> /dev/null; then
        alias ls='colorls -G'
        colorls -G "$@"
    elif type -p gls &> /dev/null; then
        alias ls='gls --color=auto'
        gls --color=auto "$@"
    elif command ls --color -d / &> /dev/null; then
        alias ls='ls --color=auto'
        command ls --color=auto "$@"
    elif command ls -G -d / &> /dev/null; then
        alias ls='ls -G'
        command ls -G "$@"
    else
        unalias ls
        command ls "$@"
    fi
}

#if [[ -z "$BASE16_THEME" ]]; then
#    export LSCOLORS=Exfxcxdxbxegedabagacad
#    if type -p dircolors &> /dev/null;then
#        eval $(dircolors ~/.sh/dircolors.256dark)
#    elif type -p gdircolors &> /dev/null;then
#        eval $(gdircolors ~/.sh/dircolors.256dark)
#    fi
#fi
