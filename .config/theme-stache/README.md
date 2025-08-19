![theme stache logo](/images/theme-stache.png)

# theme stache "stash"

Building themes to any target using mustache templates.

## theme sources

* [Gogh](https://github.com/Gogh-Co/Gogh/tree/master/themes) (https://gogh-co.github.io/Gogh/)
* [Base16](https://github.com/tinted-theming/schemes/tree/spec-0.11/base16)
* [Base24](https://github.com/tinted-theming/schemes/tree/spec-0.11/base24)
* [iTerm](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes) (https://gogh-co.github.io/Gogh/)

## targets

### shell

* [shell.sh](/build/shell) xterm OSC shell script

install

```bash
mkdir -p $HOME/.config
cd $HOME/.config
git clone https://github.com/j-c-m/theme-stache.git
```

sample .bashrc or .zshrc addtion

```bash
THEME_STACHE="${HOME}/.config/theme-stache"         # Directory for theme-stache
DEFAULT_THEME="iterm-spacegray-eighties"            # Default theme name
THEME_STACHE_BIN="${HOME}/bin/theme-stache"         # Path to theme-stache binary symlink

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

if [[ -n $ZSH_VERSION ]]; then
    autoload -U add-zsh-hook
    add-zsh-hook precmd precmd_reset_theme
fi

alias reset="command reset && reset_theme"

reset_theme

unset THEME_STACHE DEFAULT_THEME THEME_STACHE_BIN
```

Use theme-stache (theme-stach.py) to browse, activate, or install themes (create .shell_theme.sh symlink).

![theme-stache tool screenshot](/images/theme-stache-screenshot.png)

[ansi-dim.vim](https://raw.githubusercontent.com/j-c-m/dotfiles/refs/heads/master/.vim/colors/ansi-dim.vim)

Recommended vimrc colorscheme section, let the 16 colors do the work!

```vimscript
if &t_Co > 16
  set t_Co=16
endif

colorscheme ansi-dim
```

### alacritty

* [alacritty](/build/alacritty) Alacritty terminal emulator

Add an import to your `alacritty.toml` (Replace `{theme}` with your desired
colorscheme):

```toml
[general]
import = [
    "~/.config/theme-stache/build/alacritty/{theme}.toml"
]
```
### iterm2

* [iterm2](/build/itermcolors/) iTerm2 terminal emulator

# to be continued ...
