setopt PROMPT_SUBST

# primary prompt (standard color)
function update_prompt() {
    GP=''

    if [[ $(echotc Co 2> /dev/null) -ge 256 ]]; then
        if [[ -n "$BASE16_THEME" ]]; then
            PROMPT='[%F{15}%*%f] %D{%a %b %d} \
[%F{6}%K{19}%~${GP}%f%k]:\
%(!.%F{9}.%F{15})%K{4}%n@%m%f%k
%(!.#.$) '
        else
            PROMPT='[%F{253}%*%f] %D{%a %b %d} \
[%F{116}%K{239}%~${GP}%f%k]:\
%(!.%F{1}.%F{253})%K{25}%n@%m%f%k
%(!.#.$) '
        fi
    else
        PROMPT='[%B%F{7}%B%*%f%b] %D{%a %b %d} \
[%B%F{6}%K{4}%~${GP}%k%f%b]:\
%(!.%F{1}.%F{7})%K{4}%n@%m%k%f
%(!.#.$) '
    fi

    if ! git_in_tree; then
        return
    fi

    if [[ $# -eq 0 ]]; then
        GP=$(git_echo_prompt no_dirty_check)
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

async_start_worker git_prompt -n
async_register_callback git_prompt update_prompt
