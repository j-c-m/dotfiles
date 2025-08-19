#!/usr/bin/env python3
import json
import os
import math
import argparse

def hex_to_rgb(hex_color):
    """Convert hex color to RGB tuple."""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def ansi_color(fg_hex=None, bg_hex=None):
    """Generate ANSI escape code for foreground and/or background color."""
    if not fg_hex and not bg_hex:
        return "\033[0m"  # Reset
    parts = []
    if fg_hex:
        r, g, b = hex_to_rgb(fg_hex)
        parts.append(f"38;2;{r};{g};{b}")
    if bg_hex:
        r, g, b = hex_to_rgb(bg_hex)
        parts.append(f"48;2;{r};{g};{b}")
    return f"\033[{';'.join(parts)}m"

def html_color(fg_hex=None, bg_hex=None):
    """Generate HTML span with color styling."""
    if not fg_hex and not bg_hex:
        return "", ""  # No open/close tags needed
    styles = []
    if fg_hex:
        styles.append(f"color:{fg_hex}")
    if bg_hex:
        styles.append(f"background:{bg_hex}")
    return f"<span style=\"{';'.join(styles)}\">", "</span>"

def relative_luminance(rgb):
    """Calculate relative luminance for a color."""
    r, g, b = [x / 255.0 for x in rgb]
    r = r / 12.92 if r <= 0.03928 else ((r + 0.055) / 1.055) ** 2.4
    g = g / 12.92 if g <= 0.03928 else ((g + 0.055) / 1.055) ** 2.4
    b = b / 12.92 if b <= 0.03928 else ((b + 0.055) / 1.055) ** 2.4
    return 0.2126 * r + 0.7152 * g + 0.0722 * b

def contrast_ratio(l1, l2):
    """Calculate WCAG contrast ratio."""
    lighter = max(l1, l2)
    darker = min(l1, l2)
    return (lighter + 0.05) / (darker + 0.05)

def check_wcag_contrast(fg_hex, bg_hex, threshold):
    """Check if contrast ratio meets WCAG threshold."""
    fg_rgb = hex_to_rgb(fg_hex)
    bg_rgb = hex_to_rgb(bg_hex)
    fg_luminance = relative_luminance(fg_rgb)
    bg_luminance = relative_luminance(bg_rgb)
    ratio = contrast_ratio(fg_luminance, bg_luminance)
    return ratio >= threshold, ratio

def fg_bg_wcag_check(scheme, format_color):
    """Check WCAG contrast for foreground against background."""
    threshold = 2
    issues = []
    fg_hex = scheme.get('foreground-hex')
    bg_hex = scheme.get('background-hex')
    if fg_hex and bg_hex:
        passes, ratio = check_wcag_contrast(fg_hex, bg_hex, threshold)
        if not passes:
            issues.append(
                f"foreground-hex ({format_color(fg_hex, fg_hex=fg_hex)}) on "
                f"background-hex ({format_color(bg_hex, fg_hex=bg_hex)}) "
                f"{format_color('fails WCAG contrast', fg_hex=fg_hex, bg_hex=bg_hex)} "
                f"(ratio: {ratio:.2f}, required: {threshold:.2f})"
            )
    return issues

def adjacent_colors_check(scheme, format_color):
    """Check for identical adjacent colors (ansi-0 to ansi-15)."""
    issues = []
    for i in range(15):
        key1 = f'ansi-{i}-hex'
        key2 = f'ansi-{i+1}-hex'
        if scheme.get(key1) and scheme.get(key2) and scheme[key1] == scheme[key2]:
            hex_val = scheme[key1]
            issues.append(
                f"Adjacent colors {key1} and {key2} are identical "
                f"({format_color(hex_val, fg_hex=hex_val)})"
            )
    return issues

def check_color_scheme(file_path, output_mode):
    """Check a color scheme for issues."""
    with open(file_path, 'r') as f:
        scheme = json.load(f)

    issues = []
    scheme_name = scheme.get('theme-name', os.path.basename(file_path))
    theme_source_slug = scheme.get('theme-source-slug', '')
    theme_slug = scheme.get('theme-slug', '')
    fg_hex = scheme.get('foreground-hex', '#ffffff')  # Default to white if missing

    # Helper function to format colors based on output mode
    def format_color(text, fg_hex=None, bg_hex=None):
        if output_mode == 'ansi':
            return f"{ansi_color(fg_hex, bg_hex)}{text}{ansi_color()}"
        elif output_mode == 'html':
            open_tag, close_tag = html_color(fg_hex, bg_hex)
            return f"{open_tag}{text}{close_tag}"
        return text  # plain mode

    # Define configurable checks
    checks = [
        fg_bg_wcag_check,
        adjacent_colors_check
    ]

    # Run each check and collect issues
    for check in checks:
        issues.extend(check(scheme, format_color))

    return scheme.get('theme-source', ''), scheme_name, theme_source_slug, theme_slug, issues, file_path, fg_hex

def main():
    """Process all JSON files in build/json, sort by theme-source and theme-name, and output issues in Markdown."""
    parser = argparse.ArgumentParser(description="Check color schemes for issues.")
    parser.add_argument('--ansi', action='store_const', const='ansi', dest='output_mode', help='Use ANSI color codes')
    parser.add_argument('--html', action='store_const', const='html', dest='output_mode', help='Use HTML span tags')
    parser.add_argument('--plain', action='store_const', const='plain', dest='output_mode', help='Use plain text (no color)')
    args = parser.parse_args()
    output_mode = args.output_mode or 'ansi'  # Default to ansi

    output = ["# Color Scheme Issues", ""]
    json_dir = "build/json"

    if not os.path.exists(json_dir):
        output.append("No JSON files found in build/json directory.")
        return "\n".join(output)

    # Collect schemes with their metadata
    schemes = []
    for filename in os.listdir(json_dir):
        if filename.endswith('.json'):
            file_path = os.path.join(json_dir, filename)
            source, name, source_slug, slug, issues, path, fg_hex = check_color_scheme(file_path, output_mode)
            if issues:  # Only include schemes with issues
                schemes.append((source, name, source_slug, slug, issues, path, fg_hex))

    if not schemes:
        output.append("No issues found in any color schemes.")
        return "\n".join(output)

    # Sort schemes by theme-source, then theme-name
    schemes.sort(key=lambda x: (x[0].lower(), x[1].lower()))

    # Generate output for each scheme with issues
    for source, name, source_slug, slug, issues, path, fg_hex in schemes:
        filename = os.path.basename(path)
        header = f"{source_slug} {name} ({filename})"
        output.append(f"## {header}")
        output.append("### Issues Found")
        for issue in issues:
            output.append(f"- {issue}")
        output.append("")

    return "\n".join(output)

if __name__ == "__main__":
    print(main())
