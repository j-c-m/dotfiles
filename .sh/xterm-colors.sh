case "$TERM" in
    xterm*)
        ;;
    *)
        return
        ;;
esac

echo -ne '\e]10;#AAAAAA\a'  # foreground
echo -ne '\e]11;#1c1c1c\a'  # background
echo -ne '\e]12;#AAAAAA\a'  # cursor

echo -ne '\e]4;0;#000000\a'   # black
echo -ne '\e]4;1;#AA0000\a'   # red
echo -ne '\e]4;2;#00AA00\a'   # green
echo -ne '\e]4;3;#AA5500\a'   # yellow/brown
echo -ne '\e]4;4;#0000AA\a'   # blue
echo -ne '\e]4;5;#AA00AA\a'   # magenta
echo -ne '\e]4;6;#00AAAA\a'   # cyan
echo -ne '\e]4;7;#AAAAAA\a'   # white (light grey really)
echo -ne '\e]4;8;#555555\a'   # bold black (i.e. dark grey)
echo -ne '\e]4;9;#FF5555\a'   # bold red
echo -ne '\e]4;10;#55FF55\a'  # bold green
echo -ne '\e]4;11;#FFFF55\a'  # bold yellow
echo -ne '\e]4;12;#5555FF\a'  # bold blue
echo -ne '\e]4;13;#FF55FF\a'  # bold magenta
echo -ne '\e]4;14;#55FFFF\a'  # bold cyan
echo -ne '\e]4;15;#FFFFFF\a'  # bold white
