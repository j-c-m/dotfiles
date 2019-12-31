export COLORTERM=1
export CLICOLOR=1

alias ls='_ls_lazy'

_ls_lazy()
{
    if type -p colorls &> /dev/null; then
        alias ls='colorls'
        colorls $@
    elif type -p gls &> /dev/null; then
        alias ls='gls --color=auto'
        gls --color=auto $@
    elif command ls --color -d / . &>/dev/null; then
        alias ls='ls --color=auto'
        command ls --color=auto $@
    else
        unalias ls
        command ls $@
    fi
}

if [[ -z "$BASE16_THEME" ]]; then
    export LSCOLORS=Exfxcxdxbxegedabagacad
    if type -p dircolors &> /dev/null;then
        eval $(dircolors ~/.sh/dircolors.256dark)
    elif type -p gdircolors &> /dev/null;then
        eval $(gdircolors ~/.sh/dircolors.256dark)
    fi
fi
