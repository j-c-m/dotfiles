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
THEME_STACHE="${HOME}/.config/theme-stache"
DEFAULT_THEME="base16-eighties"

if [ ! -f "${HOME}/.shell_theme.sh" ]; then
    ln -s "${THEME_STACHE}/build/shell/${DEFAULT_THEME}.sh" "${HOME}/.shell_theme.sh"
fi

if [ ! -f "${HOME}/bin/theme-stache" ]; then
    mkdir -p "${HOME}/bin"
    ln -s "${THEME_STACHE}/theme-stache.py" "${HOME}/bin/theme-stache"
fi

source "${HOME}/.shell_theme.sh"

unset THEME_STACHE
unset DEFAULT_THEME
```

Use theme-stache (theme-stach.py) to browse, activate, or install themes (create .shell_theme.sh symlink).

![theme-stache tool screenshot](/images/theme-stache-screenshot.png)

Recommended vimrc colorscheme section, let the 16 colors do the work!

```vimscript
if &t_Co > 16
  set t_Co=16
endif

set notermguicolors
colorscheme habamax
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

# to be continued ...
