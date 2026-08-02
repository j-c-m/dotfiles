# Terminfo entries

Portable terminfo sources and compiled entries for terminals that may be missing
from the system database (especially over SSH).

## Layout

| Path | Role |
|------|------|
| `*.info` / `*.terminfo` | Human-readable sources |
| `a/`, `x/`, `g/`, … | Compiled entries keyed by **first letter** |
| `61/`, `78/`, `67/`, … | Compiled entries keyed by **hex of first letter** (`a`→`61`, `x`→`78`, `g`→`67`) |

Hex directories are **symlinks** into the letter directories so both ncurses lookup
styles work (macOS `tic` prefers hex; some systems use the letter).

| Source | Terms | Origin |
|--------|-------|--------|
| `alacritty.info` | `alacritty`, `alacritty-direct` | [alacritty/extra/alacritty.info](https://github.com/alacritty/alacritty/blob/master/extra/alacritty.info) |
| `ghostty.terminfo` | `xterm-ghostty`, `ghostty` | `infocmp -x` from Ghostty.app |
| `kitty.terminfo` | `xterm-kitty` | Kitty dump |

## Compile

Requires `tic` (ncurses). Always use **`-x`** so user-defined capabilities
(`Tc`, `RGB`, bracketed paste, focus events, etc.) are preserved.

From the **repository root**:

```bash
# Compile into this tree
tic -x -o .terminfo .terminfo/alacritty.info
tic -x -o .terminfo .terminfo/ghostty.terminfo
tic -x -o .terminfo .terminfo/kitty.terminfo
```

macOS `tic` writes only hex dirs (`61/`, `67/`, `78/`). To keep the dual
letter/hex layout used in this repo:

```bash
# After tic, copy hex → letter and re-point hex as symlinks
for hex in 61 67 78; do
  letter=$(printf "\\x$hex")
  [ -d ".terminfo/$hex" ] || continue
  mkdir -p ".terminfo/$letter"
  for f in ".terminfo/$hex"/*; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    # skip use= fragments if any
    case "$name" in *+*) rm -f "$f"; continue ;; esac
    if [ -L "$f" ]; then continue; fi
    cp -f "$f" ".terminfo/$letter/$name"
    ln -sfn "../$letter/$name" ".terminfo/$hex/$name"
  done
done
```

Or install for the current user only:

```bash
tic -x .terminfo/alacritty.info
tic -x .terminfo/ghostty.terminfo
tic -x .terminfo/kitty.terminfo
# → ~/.terminfo/
```

## Refresh sources

### Alacritty

```bash
curl -fsSL \
  'https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info' \
  -o .terminfo/alacritty.info
tic -x -o .terminfo .terminfo/alacritty.info
# then fix letter/hex layout as above
```

### Ghostty

Dump from the app bundle with **`-x`** (without it, extended caps are stripped):

```bash
infocmp -x -A /Applications/Ghostty.app/Contents/Resources/terminfo xterm-ghostty \
  > .terminfo/ghostty.terminfo
tic -x -o .terminfo .terminfo/ghostty.terminfo
# then fix letter/hex layout as above
```

Ghostty ships both `78/xterm-ghostty` and `67/ghostty` (same entry, two names).

### Kitty

```bash
# from a machine with kitty installed, or copy from Kitty.app Resources
infocmp -x xterm-kitty > .terminfo/kitty.terminfo
tic -x -o .terminfo .terminfo/kitty.terminfo
```

## Verify

```bash
TERMINFO="$PWD/.terminfo" infocmp -x alacritty | head
TERMINFO="$PWD/.terminfo" infocmp -x xterm-ghostty | head
TERMINFO="$PWD/.terminfo" infocmp -x ghostty | head
TERMINFO="$PWD/.terminfo" infocmp -x xterm-kitty | head
```

Sanity-check that extended caps survived a Ghostty refresh:

```bash
TERMINFO="$PWD/.terminfo" infocmp -1x xterm-ghostty | grep -E '^(Tc|AX|BD|BE|setrgbf)'
```

## Notes

- Do **not** run plain `infocmp` (no `-x`) when refreshing Ghostty/Kitty; you will
  lose truecolor and other user capabilities.
- After editing a source, always recompile; sources and binaries can drift.
- `alacritty+common` is a `use=` fragment only — not a real `TERM`; discard it if
  `tic` emits a compiled file for it.
