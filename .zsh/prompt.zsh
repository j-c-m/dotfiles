setopt PROMPT_SUBST

# primary prompt (standard color)
function update_prompt() {
    GP=''
    PROMPT='[%{$fg_bold[white]%}%*%{$reset_color%}] %D{%a %b %d} \
[%{$fg_bold[cyan]$bg[blue]%}%~${GP}%{$reset_color%}]:\
%(!.%{$fg[red]%}.%{$fg[white]%})%{$bg[blue]%}%n@%m%{$reset_color%}
%(!.#.$) '

    if ! git_in_tree; then
        return
    fi

    if [[ $# -eq 0 ]]; then
        GP=$(git_echo_prompt no_dirty_check)
        async_stop_worker git_prompt
        async_start_worker git_prompt -n
        async_register_callback git_prompt update_prompt
        async_job git_prompt cd_call $PWD git_echo_prompt
    else
        if [[ $GP == $3 ]]; then
            return
        fi
        GP=$3
    fi

    zle && zle reset-prompt
}

function cd_call() {
    cd $1
    $2
}

# right
RPROMPT=

# git settings
GIT_PROMPT_PREFIX=":"
GIT_PROMPT_CLEAN=
GIT_PROMPT_DIRTY="%{$fg_no_bold[red]%}*"
GIT_PROMPT_SUFFIX=

precmd_functions+=(update_prompt)
