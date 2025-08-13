#!/usr/bin/env python3
import curses
import json
import sys
import os
import subprocess
from pathlib import Path

def hex_to_rgb(hex_color):
    """Convert hex color (#RRGGBB) to RGB tuple (0-255)."""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def calculate_luminance(r, g, b):
    """Calculate relative luminance for a color (R,G,B in 0-255)."""
    def adjust(c):
        c = c / 255.0
        return c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4
    r, g, b = adjust(r), adjust(g), adjust(b)
    return 0.2126 * r + 0.7152 * g + 0.0722 * b

def contrast_ratio(fg_hex, bg_hex):
    """Calculate WCAG contrast ratio between two hex colors."""
    fg_rgb = hex_to_rgb(fg_hex)
    bg_rgb = hex_to_rgb(bg_hex)
    lum_fg = calculate_luminance(*fg_rgb)
    lum_bg = calculate_luminance(*bg_rgb)
    lum_lighter = max(lum_fg, lum_bg)
    lum_darker = min(lum_fg, lum_bg)
    return (lum_lighter + 0.05) / (lum_darker + 0.05)

def choose_readable_foreground(fg_hex, bg_hex):
    """Choose a readable foreground color based on WCAG contrast ratio."""
    if contrast_ratio(fg_hex, bg_hex) >= 2:
        return fg_hex
    black_ratio = contrast_ratio('#000000', bg_hex)
    white_ratio = contrast_ratio('#FFFFFF', bg_hex)
    return '#000000' if black_ratio > white_ratio else '#FFFFFF'

def activate_theme(script_path):
    """Run the shell script to apply theme colors, passing output to stdout/stderr."""
    if script_path.is_file():
        try:
            curses.reset_shell_mode()
            result = subprocess.run(["bash", "--noprofile", "--norc", str(script_path)], capture_output=True, text=True)
            sys.stdout.write(result.stdout)
            sys.stderr.write(result.stderr)
            sys.stdout.flush()
            sys.stderr.flush()
            return True
        except subprocess.SubprocessError:
            pass  # Silently ignore errors
    return False

def load_themes(directory):
    """Load metadata from all JSON files in the directory."""
    themes = []
    json_files = list(Path(directory).glob('*.json'))
    for file in json_files:
        try:
            with open(file, 'r') as f:
                theme = json.load(f)
            themes.append({
                'file': file,
                'name': theme.get('theme-name', 'Unknown'),
                'source': theme.get('theme-source', 'Unknown'),
                'variant': theme.get('theme-variant', 'Unknown'),
                'slug': theme.get('theme-slug', file.stem),
                'source-slug': theme.get('theme-source-slug', file.stem.split('-')[0])
            })
        except json.JSONDecodeError:
            print(f"Skipping invalid JSON file: {file}")
    # Sort by name (lower), then source (lower)
    return sorted(themes, key=lambda t: (t['name'].lower(), t['source'].lower()))

def update_preview(win, file_path):
    """Update the preview window with theme colors and metadata in a 2-column grid layout."""
    try:
        with open(file_path, 'r') as f:
            theme = json.load(f)
    except json.JSONDecodeError:
        win.addstr(1, 1, "Error: Invalid JSON file")
        return

    # ANSI color names
    ansi_names = [
        "Black", "Red", "Green", "Yellow", "Blue", "Magenta", "Cyan", "White",
        "Bright Black", "Bright Red", "Bright Green", "Bright Yellow",
        "Bright Blue", "Bright Magenta", "Bright Cyan", "Bright White"
    ]

    # Redefine colors (1-25)
    for i in range(16):
        hex_val = theme.get(f'ansi-{i}-hex', '#000000')
        r, g, b = hex_to_rgb(hex_val)
        curses.init_color(i + 1, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    fg_hex = theme.get('foreground-hex', '#FFFFFF')
    r, g, b = hex_to_rgb(fg_hex)
    curses.init_color(17, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    bg_hex = theme.get('background-hex', '#000000')
    r, g, b = hex_to_rgb(bg_hex)
    curses.init_color(18, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    cursor_hex = theme.get('cursor-hex', '#FFFFFF')
    r, g, b = hex_to_rgb(cursor_hex)
    curses.init_color(19, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    sel_hex = theme.get('selection-hex', '#CCCCCC')
    r, g, b = hex_to_rgb(sel_hex)
    curses.init_color(20, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    sel_text_hex = theme.get('selection-text-hex', '#000000')
    r, g, b = hex_to_rgb(sel_text_hex)
    curses.init_color(21, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    r, g, b = hex_to_rgb('#000000')
    curses.init_color(23, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)
    r, g, b = hex_to_rgb('#FFFFFF')
    curses.init_color(24, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)

    # Color pair for key names (ansi-1-hex on bg)
    ansi_1_hex = theme.get('ansi-1-hex', '#FF0000')
    r, g, b = hex_to_rgb(ansi_1_hex)
    curses.init_color(25, r * 1000 // 255, g * 1000 // 255, b * 1000 // 255)
    fg = choose_readable_foreground(ansi_1_hex, bg_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 25
    curses.init_pair(24, fg_color, 18)  # ansi-1 on bg

    # Define color pairs
    curses.init_pair(1, 17, 18)  # fg on bg (default)
    for i in range(16):
        fg = choose_readable_foreground(fg_hex, theme.get(f'ansi-{i}-hex', '#000000'))
        fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
        curses.init_pair(2 + i, fg_color, i + 1)  # adjusted fg on ansi-i bg
    fg = choose_readable_foreground(fg_hex, cursor_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
    curses.init_pair(18, fg_color, 19)  # adjusted fg on cursor
    curses.init_pair(19, 21, 20)  # sel_text on sel
    fg = choose_readable_foreground(fg_hex, bg_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
    curses.init_pair(20, fg_color, 18)  # adjusted fg on bg
    fg = choose_readable_foreground(fg_hex, fg_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
    curses.init_pair(21, fg_color, 17)  # adjusted fg on fg
    fg = choose_readable_foreground(fg_hex, sel_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
    curses.init_pair(22, fg_color, 20)  # adjusted fg on sel
    fg = choose_readable_foreground(fg_hex, sel_text_hex)
    fg_color = 23 if fg == '#000000' else 24 if fg == '#FFFFFF' else 17
    curses.init_pair(23, fg_color, 21)  # adjusted fg on sel_text

    # Set background
    win.bkgd(' ', curses.color_pair(1))

    # Draw content
    win.box()
    height, width = win.getmaxyx()
    # Calculate grid dimensions
    total_colors = 21  # 16 ANSI + 5 others
    metadata_lines = 6  # Title + Theme + Author + Variant + Source + blank
    header_lines = 2  # "ANSI Colors:" + "Other Colors:"
    shortcuts_lines = 1  # Shortcuts at bottom
    box_height = 2  # Fixed height for each rectangle (name + hex, no padding)
    min_box_width = 10  # Minimum width for each rectangle
    # Fixed 2-column grid
    cols = 2
    box_width = max(min_box_width, (width - 3) // cols)  # Fill window width
    # Calculate rows needed
    ansi_rows = 8  # 16 colors in 8x2 grid (0-7 next to 8-15)
    other_rows = 3  # 5 colors in 3x2 grid (ceiling(5/2))
    total_rows = ansi_rows + other_rows
    # Ensure grid fits
    grid_height = height - metadata_lines - header_lines - shortcuts_lines - 1  # -1 for border
    if grid_height < total_rows * box_height:
        box_height = max(1, grid_height // total_rows)  # Reduce height if needed

    try:
        win.addstr(0, 1, "Preview", curses.color_pair(1))
        line = 1
        win.addstr(line, 1, f"Theme: {theme.get('theme-name', 'Unknown')}"[:width-2], curses.color_pair(1))
        line += 1
        win.addstr(line, 1, f"Author: {theme.get('theme-author', 'Unknown')}"[:width-2], curses.color_pair(1))
        line += 1
        win.addstr(line, 1, f"Variant: {theme.get('theme-variant', 'Unknown')}"[:width-2], curses.color_pair(1))
        line += 1
        win.addstr(line, 1, f"Source: {theme.get('theme-source', 'Unknown')}"[:width-2], curses.color_pair(1))
        line += 2

        # ANSI Colors Grid (8x2, 0-7 next to 8-15)
        win.addstr(line, 1, "ANSI Colors:", curses.color_pair(1))
        line += 1
        for row in range(ansi_rows):
            for col in range(cols):
                idx = row + col * 8  # Pair 0 with 8, 1 with 9, etc.
                if idx >= 16:
                    break
                try:
                    x = 1 + col * box_width
                    y = line + row * box_height
                    name = ansi_names[idx][:box_width-2]
                    hex_val = theme.get(f'ansi-{idx}-hex', '#000000')[:box_width-2]
                    win.addstr(y, x, f"{name:^{box_width-2}}", curses.color_pair(2 + idx))
                    if y + 1 < height:
                        win.addstr(y + 1, x, f"{hex_val:^{box_width-2}}", curses.color_pair(2 + idx))
                except curses.error:
                    pass
        line += box_height * ansi_rows

        # Other Colors Grid (3x2)
        win.addstr(line, 1, "Other Colors:", curses.color_pair(1))
        line += 1
        other_colors = [
            ("Foreground", fg_hex, 21),
            ("Background", bg_hex, 20),
            ("Cursor", cursor_hex, 18),
            ("Selection", sel_hex, 22),
            ("Sel Text", sel_text_hex, 23)
        ]
        for idx, (name, hex_val, pair) in enumerate(other_colors):
            col = idx % cols
            row = idx // cols
            try:
                x = 1 + col * box_width
                y = line + row * box_height
                name_text = name[:box_width-2]
                hex_text = hex_val[:box_width-2]
                win.addstr(y, x, f"{name_text:^{box_width-2}}", curses.color_pair(pair))
                if y + 1 < height:
                    win.addstr(y + 1, x, f"{hex_text:^{box_width-2}}", curses.color_pair(pair))
            except curses.error:
                pass

        # Keyboard shortcuts at bottom
        try:
            shortcuts = [
                ("q", " quit", 24, 1),
                (", ", "", 1, 1),
                ("a", " activate", 24, 1),
                (", ", "", 1, 1),
                ("i", " install", 24, 1),
                (", ", "", 1, 1),
                ("↑↓", " navigate", 24, 1),
                (", ", "", 1, 1),
                ("PgUp/PgDn", " scroll", 24, 1)
            ]
            x = 1
            for key, text, key_pair, text_pair in shortcuts:
                if x + len(key + text) < width - 2:
                    win.addstr(height - 2, x, key, curses.color_pair(key_pair))
                    x += len(key)
                    win.addstr(height - 2, x, text, curses.color_pair(text_pair))
                    x += len(text)
        except curses.error:
            pass
    except curses.error:
        pass

def draw_ui(stdscr, themes, current_idx, offset):
    """Draw the list and preview windows."""
    height, width = stdscr.getmaxyx()
    list_width = min(30, width // 3)  # Narrower list window
    preview_width = width - list_width

    # Create windows
    list_win = curses.newwin(height, list_width, 0, 0)
    preview_win = curses.newwin(height, preview_width, 0, list_width)

    # Draw list window
    list_win.box()
    try:
        list_win.addstr(0, 1, "Themes")
        max_themes = height - 3  # Reserve space for title
        for i in range(offset, min(offset + max_themes, len(themes))):
            theme = themes[i]
            text = f"{theme['name']} ({theme['source']}, {theme['variant']})"[:list_width-2]
            attr = curses.A_REVERSE if i == current_idx else 0
            list_win.addstr(i - offset + 1, 1, text, attr)
    except curses.error:
        pass
    list_win.refresh()

    # Draw preview window
    update_preview(preview_win, themes[current_idx]['file'])
    preview_win.refresh()

def main(stdscr, themes):
    curses.curs_set(0)  # Hide cursor
    curses.start_color()
    curses.use_default_colors()
    stdscr.timeout(-1)  # Blocking input

    current_idx = 0
    offset = 0
    last_activated_script = None  # Track last activated theme script

    # Force initial render
    stdscr.clear()
    stdscr.redrawwin()
    draw_ui(stdscr, themes, current_idx, offset)
    stdscr.noutrefresh()
    curses.doupdate()
    stdscr.refresh()
    # Retry refresh to handle terminal buffering
    for _ in range(3):
        draw_ui(stdscr, themes, current_idx, offset)
        stdscr.noutrefresh()
        curses.doupdate()
        stdscr.refresh()

    while True:
        key = stdscr.getch()
        height, _ = stdscr.getmaxyx()
        max_themes = height - 3  # Visible themes in list window
        if key == curses.KEY_UP and current_idx > 0:
            current_idx -= 1
            if current_idx < offset:
                offset -= 1
        elif key == curses.KEY_DOWN and current_idx < len(themes) - 1:
            current_idx += 1
            if current_idx >= offset + max_themes:
                offset += 1
        elif key == curses.KEY_PPAGE and current_idx > 0:
            current_idx = max(0, current_idx - max_themes)
            offset = max(0, offset - max_themes)
        elif key == curses.KEY_NPAGE and current_idx < len(themes) - 1:
            current_idx = min(len(themes) - 1, current_idx + max_themes)
            if current_idx >= offset + max_themes:
                offset = min(len(themes) - max_themes, offset + max_themes)
        elif key == ord('a'):
            script_path = Path(__file__).resolve().parent / "build" / "shell" / f"{themes[current_idx]['source-slug']}-{themes[current_idx]['slug']}.sh"
            if script_path.is_file():
                subprocess.run(["bash", str(script_path)])
                last_activated_script = script_path  # Track activated theme
                stdscr.redrawwin()
                draw_ui(stdscr, themes, current_idx, offset)
                stdscr.noutrefresh()
                curses.doupdate()
                stdscr.refresh()
        elif key == ord('i'):
            script_path = Path(__file__).resolve().parent / "build" / "shell" / f"{themes[current_idx]['source-slug']}-{themes[current_idx]['slug']}.sh"
            symlink_path = Path.home() / ".shell_theme.sh"
            if script_path.is_file():
                try:
                    if symlink_path.exists() or symlink_path.is_symlink():
                        os.remove(symlink_path)
                    os.symlink(script_path, symlink_path)
                except (OSError, PermissionError):
                    pass  # Silently ignore errors
            else:
                pass  # Silently ignore missing script
        elif key == curses.KEY_RESIZE:
            stdscr.clear()
            stdscr.redrawwin()
        elif key == ord('q') or key == 27:  # q or ESC
            break

        # Redraw UI after each keypress or resize
        draw_ui(stdscr, themes, current_idx, offset)
        stdscr.noutrefresh()
        curses.doupdate()
        stdscr.refresh()

    return last_activated_script

if __name__ == "__main__":
    default_dir = Path(__file__).resolve().parent / "build" / "json"
    if len(sys.argv) > 2:
        print("Usage: python preview.py [directory]")
        sys.exit(1)
    directory = Path(sys.argv[1]) if len(sys.argv) == 2 else default_dir
    if directory.is_dir():
        themes = load_themes(directory)
        if not themes:
            print(f"No valid JSON theme files found in {directory}.")
            sys.exit(1)
        print(f"Loaded {len(themes)} themes from {directory}.")
        last_activated_script = curses.wrapper(main, themes)
        # Run the last activated script again outside curses.wrapper
        if last_activated_script:
            subprocess.run(["bash", str(last_activated_script)])
    else:
        print(f"Invalid path: {directory}. Provide a directory containing JSON files.")
        sys.exit(1)
