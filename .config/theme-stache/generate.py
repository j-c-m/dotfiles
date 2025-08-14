#!/usr/bin/env python3
import json
import yaml
import plistlib
import pystache
import os
import re
from pathlib import Path
import glob
from unidecode import unidecode

def load_config(config_path):
    """Load the config.json file."""
    with open(config_path, 'r') as f:
        return json.load(f)

def load_yaml(yaml_path):
    """Load a YAML color scheme file."""
    try:
        with open(yaml_path, 'r') as f:
            return yaml.safe_load(f)
    except Exception as e:
        print(f"Error loading YAML file {yaml_path}: {e}")
        return None

def load_plist(plist_path):
    """Load an iTerm .itermcolors plist file."""
    try:
        with open(plist_path, 'rb') as f:
            return plistlib.load(f)
    except Exception as e:
        print(f"Error loading plist file {plist_path}: {e}")
        return None

def rgb_to_hex(r, g, b):
    """Convert RGB values (0-1) to hex format (#RRGGBB)."""
    r = int(r * 255)
    g = int(g * 255)
    b = int(b * 255)
    return f"#{r:02x}{g:02x}{b:02x}"

def invert_hex_color(hex_color):
    """Invert a hex color (#RRGGBB) to its complementary color."""
    hex_color = hex_color.lstrip('#')
    if len(hex_color) != 6:
        raise ValueError(f"Invalid hex color format: {hex_color}")
    r = 255 - int(hex_color[0:2], 16)
    g = 255 - int(hex_color[2:4], 16)
    b = 255 - int(hex_color[4:6], 16)
    return f"#{r:02x}{g:02x}{b:02x}"

def slugify(name):
    """Convert theme name to a slug (lowercase, replace spaces with hyphens)."""
    name = unidecode(name)
    name = name.lower()
    name = name.replace(' ', '-').replace('_', '-')
    name = re.sub(r'[^0-9a-z-]', '', name)
    return name

def map_theme_data(theme_data, source, theme_path):
    """Map theme data from different sources to the standard context for Mustache templates."""
    context = {
        'theme-source': source,
        'theme-source-slug': slugify(source)
    }

    if source == 'gogh':
        # Required fields for Gogh schema
        required_fields = [
            'name', 'author', 'variant',
            'color_01', 'color_02', 'color_03', 'color_04',
            'color_05', 'color_06', 'color_07', 'color_08',
            'color_09', 'color_10', 'color_11', 'color_12',
            'color_13', 'color_14', 'color_15', 'color_16',
            'foreground', 'background', 'cursor'
        ]
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        context.update({
            'theme-slug': slugify(theme_data['name']),
            'theme-name': theme_data['name'],
            'theme-variant': theme_data['variant'],
            'theme-author': theme_data['author'],
            'ansi-0-hex': theme_data['color_01'],
            'ansi-1-hex': theme_data['color_02'],
            'ansi-2-hex': theme_data['color_03'],
            'ansi-3-hex': theme_data['color_04'],
            'ansi-4-hex': theme_data['color_05'],
            'ansi-5-hex': theme_data['color_06'],
            'ansi-6-hex': theme_data['color_07'],
            'ansi-7-hex': theme_data['color_08'],
            'ansi-8-hex': theme_data['color_09'],
            'ansi-9-hex': theme_data['color_10'],
            'ansi-10-hex': theme_data['color_11'],
            'ansi-11-hex': theme_data['color_12'],
            'ansi-12-hex': theme_data['color_13'],
            'ansi-13-hex': theme_data['color_14'],
            'ansi-14-hex': theme_data['color_15'],
            'ansi-15-hex': theme_data['color_16'],
            'foreground-hex': theme_data['foreground'],
            'background-hex': theme_data['background'],
            'cursor-hex': theme_data['cursor'],
            'selection-hex': theme_data['color_08'],
            'selection-text-hex': invert_hex_color(theme_data['color_08'])
        })
    elif source == 'base16':
        # Required fields for Base16 schema
        required_fields = ['name', 'author', 'variant', 'palette']
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        palette = theme_data['palette']
        required_palette_fields = [
            'base00', 'base01', 'base02', 'base03', 'base04',
            'base05', 'base06', 'base07', 'base08', 'base09',
            'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F'
        ]
        missing_palette_fields = [field for field in required_palette_fields if palette.get(field) is None]
        if missing_palette_fields:
            raise ValueError(f"Missing required palette fields in {theme_path}: {', '.join(missing_palette_fields)}")

        context.update({
            'theme-slug': slugify(theme_data['name']),
            'theme-name': theme_data['name'],
            'theme-variant': theme_data['variant'],
            'theme-author': theme_data['author'],
            'ansi-0-hex': palette['base00'],  # Black
            'ansi-1-hex': palette['base08'],  # Red
            'ansi-2-hex': palette['base0B'],  # Green
            'ansi-3-hex': palette['base0A'],  # Yellow
            'ansi-4-hex': palette['base0D'],  # Blue
            'ansi-5-hex': palette['base0E'],  # Magenta
            'ansi-6-hex': palette['base0C'],  # Cyan
            'ansi-7-hex': palette['base05'],  # White
            'ansi-8-hex': palette['base03'],  # Bright Black
            'ansi-9-hex': palette['base08'],  # Bright Red
            'ansi-10-hex': palette['base0B'],  # Bright Green
            'ansi-11-hex': palette['base0A'],  # Bright Yellow
            'ansi-12-hex': palette['base0D'],  # Bright Blue
            'ansi-13-hex': palette['base0E'],  # Bright Magenta
            'ansi-14-hex': palette['base0C'],  # Bright Cyan
            'ansi-15-hex': palette['base07'],  # Bright White
            'foreground-hex': palette['base05'],  # Foreground
            'background-hex': palette['base00'],  # Background
            'cursor-hex': palette['base05'],  # Cursor
            'selection-hex': palette['base06'],  # Selection Background
            'selection-text-hex': invert_hex_color(palette['base06'])  # Selection Text
        })
    elif source == 'base24':
        # Required fields for Base24 schema
        required_fields = ['name', 'author', 'variant', 'palette']
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        palette = theme_data['palette']
        required_palette_fields = [
            'base00', 'base01', 'base02', 'base03', 'base04',
            'base05', 'base06', 'base07', 'base08', 'base09',
            'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F',
            'base10', 'base11', 'base12', 'base13', 'base14', 'base15',
            'base16', 'base17'
        ]
        missing_palette_fields = [field for field in required_palette_fields if palette.get(field) is None]
        if missing_palette_fields:
            raise ValueError(f"Missing required palette fields in {theme_path}: {', '.join(missing_palette_fields)}")

        context.update({
            'theme-slug': slugify(theme_data['name']),
            'theme-name': theme_data['name'],
            'theme-variant': theme_data['variant'],
            'theme-author': theme_data['author'],
            'ansi-0-hex': palette['base00'],  # Black
            'ansi-1-hex': palette['base08'],  # Red
            'ansi-2-hex': palette['base0B'],  # Green
            'ansi-3-hex': palette['base0A'],  # Yellow
            'ansi-4-hex': palette['base0D'],  # Blue
            'ansi-5-hex': palette['base0E'],  # Magenta
            'ansi-6-hex': palette['base0C'],  # Cyan
            'ansi-7-hex': palette['base05'],  # White
            'ansi-8-hex': palette['base03'],  # Bright Black
            'ansi-9-hex': palette['base12'],  # Bright Red
            'ansi-10-hex': palette['base14'],  # Bright Green
            'ansi-11-hex': palette['base13'],  # Bright Yellow
            'ansi-12-hex': palette['base16'],  # Bright Blue
            'ansi-13-hex': palette['base17'],  # Bright Magenta
            'ansi-14-hex': palette['base15'],  # Bright Cyan
            'ansi-15-hex': palette['base07'],  # Bright White
            'foreground-hex': palette['base05'],  # Foreground
            'background-hex': palette['base00'],  # Background
            'cursor-hex': palette['base05'],  # Cursor
            'selection-hex': palette['base06'],  # Selection Background
            'selection-text-hex': invert_hex_color(palette['base06'])  # Selection Text
        })
    elif source == 'iterm':
        # Required fields for iTerm .itermcolors schema
        required_fields = [
            'Ansi 0 Color', 'Ansi 1 Color', 'Ansi 2 Color', 'Ansi 3 Color',
            'Ansi 4 Color', 'Ansi 5 Color', 'Ansi 6 Color', 'Ansi 7 Color',
            'Ansi 8 Color', 'Ansi 9 Color', 'Ansi 10 Color', 'Ansi 11 Color',
            'Ansi 12 Color', 'Ansi 13 Color', 'Ansi 14 Color', 'Ansi 15 Color',
            'Background Color', 'Foreground Color', 'Cursor Color', 'Selection Color',
            'Selected Text Color'
        ]
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        # Validate RGB components for each color
        for field in required_fields:
            if not all(key in theme_data[field] for key in ['Red Component', 'Green Component', 'Blue Component']):
                raise ValueError(f"Missing RGB components in {theme_path} for {field}")

        # Extract theme name from file name (no metadata in .itermcolors)
        theme_name = Path(theme_path).stem
        context.update({
            'theme-slug': slugify(theme_name),
            'theme-name': theme_name,
            'theme-variant': 'unknown',  # No variant specified in .itermcolors
            'theme-author': 'unknown',  # No author specified in .itermcolors
            'ansi-0-hex': rgb_to_hex(
                theme_data['Ansi 0 Color']['Red Component'],
                theme_data['Ansi 0 Color']['Green Component'],
                theme_data['Ansi 0 Color']['Blue Component']
            ),
            'ansi-1-hex': rgb_to_hex(
                theme_data['Ansi 1 Color']['Red Component'],
                theme_data['Ansi 1 Color']['Green Component'],
                theme_data['Ansi 1 Color']['Blue Component']
            ),
            'ansi-2-hex': rgb_to_hex(
                theme_data['Ansi 2 Color']['Red Component'],
                theme_data['Ansi 2 Color']['Green Component'],
                theme_data['Ansi 2 Color']['Blue Component']
            ),
            'ansi-3-hex': rgb_to_hex(
                theme_data['Ansi 3 Color']['Red Component'],
                theme_data['Ansi 3 Color']['Green Component'],
                theme_data['Ansi 3 Color']['Blue Component']
            ),
            'ansi-4-hex': rgb_to_hex(
                theme_data['Ansi 4 Color']['Red Component'],
                theme_data['Ansi 4 Color']['Green Component'],
                theme_data['Ansi 4 Color']['Blue Component']
            ),
            'ansi-5-hex': rgb_to_hex(
                theme_data['Ansi 5 Color']['Red Component'],
                theme_data['Ansi 5 Color']['Green Component'],
                theme_data['Ansi 5 Color']['Blue Component']
            ),
            'ansi-6-hex': rgb_to_hex(
                theme_data['Ansi 6 Color']['Red Component'],
                theme_data['Ansi 6 Color']['Green Component'],
                theme_data['Ansi 6 Color']['Blue Component']
            ),
            'ansi-7-hex': rgb_to_hex(
                theme_data['Ansi 7 Color']['Red Component'],
                theme_data['Ansi 7 Color']['Green Component'],
                theme_data['Ansi 7 Color']['Blue Component']
            ),
            'ansi-8-hex': rgb_to_hex(
                theme_data['Ansi 8 Color']['Red Component'],
                theme_data['Ansi 8 Color']['Green Component'],
                theme_data['Ansi 8 Color']['Blue Component']
            ),
            'ansi-9-hex': rgb_to_hex(
                theme_data['Ansi 9 Color']['Red Component'],
                theme_data['Ansi 9 Color']['Green Component'],
                theme_data['Ansi 9 Color']['Blue Component']
            ),
            'ansi-10-hex': rgb_to_hex(
                theme_data['Ansi 10 Color']['Red Component'],
                theme_data['Ansi 10 Color']['Green Component'],
                theme_data['Ansi 10 Color']['Blue Component']
            ),
            'ansi-11-hex': rgb_to_hex(
                theme_data['Ansi 11 Color']['Red Component'],
                theme_data['Ansi 11 Color']['Green Component'],
                theme_data['Ansi 11 Color']['Blue Component']
            ),
            'ansi-12-hex': rgb_to_hex(
                theme_data['Ansi 12 Color']['Red Component'],
                theme_data['Ansi 12 Color']['Green Component'],
                theme_data['Ansi 12 Color']['Blue Component']
            ),
            'ansi-13-hex': rgb_to_hex(
                theme_data['Ansi 13 Color']['Red Component'],
                theme_data['Ansi 13 Color']['Green Component'],
                theme_data['Ansi 13 Color']['Blue Component']
            ),
            'ansi-14-hex': rgb_to_hex(
                theme_data['Ansi 14 Color']['Red Component'],
                theme_data['Ansi 14 Color']['Green Component'],
                theme_data['Ansi 14 Color']['Blue Component']
            ),
            'ansi-15-hex': rgb_to_hex(
                theme_data['Ansi 15 Color']['Red Component'],
                theme_data['Ansi 15 Color']['Green Component'],
                theme_data['Ansi 15 Color']['Blue Component']
            ),
            'foreground-hex': rgb_to_hex(
                theme_data['Foreground Color']['Red Component'],
                theme_data['Foreground Color']['Green Component'],
                theme_data['Foreground Color']['Blue Component']
            ),
            'background-hex': rgb_to_hex(
                theme_data['Background Color']['Red Component'],
                theme_data['Background Color']['Green Component'],
                theme_data['Background Color']['Blue Component']
            ),
            'cursor-hex': rgb_to_hex(
                theme_data['Cursor Color']['Red Component'],
                theme_data['Cursor Color']['Green Component'],
                theme_data['Cursor Color']['Blue Component']
            ),
            'selection-hex': rgb_to_hex(
                theme_data['Selection Color']['Red Component'],
                theme_data['Selection Color']['Green Component'],
                theme_data['Selection Color']['Blue Component']
            ),
            'selection-text-hex': rgb_to_hex(
                theme_data['Selected Text Color']['Red Component'],
                theme_data['Selected Text Color']['Green Component'],
                theme_data['Selected Text Color']['Blue Component']
            )
        })
    else:
        # Placeholder for other theme sources (no strict validation)
        selection_hex = theme_data.get('selection', '#555753')  # Medium Gray (Selection)
        context.update({
            'theme-slug': slugify(theme_data.get('theme_name', 'unknown')),
            'theme-name': theme_data.get('theme_name', 'Unknown Theme'),
            'theme-variant': theme_data.get('type', ''),
            'theme-author': theme_data.get('creator', ''),
            'ansi-0-hex': theme_data.get('colors', {}).get('black', '#2e3436'),      # Dark Gray (Black)
            'ansi-1-hex': theme_data.get('colors', {}).get('red', '#cc0000'),       # Red
            'ansi-2-hex': theme_data.get('colors', {}).get('green', '#4e9a06'),     # Green
            'ansi-3-hex': theme_data.get('colors', {}).get('yellow', '#c4a000'),    # Yellow
            'ansi-4-hex': theme_data.get('colors', {}).get('blue', '#3465a4'),      # Blue
            'ansi-5-hex': theme_data.get('colors', {}).get('magenta', '#75507b'),   # Magenta
            'ansi-6-hex': theme_data.get('colors', {}).get('cyan', '#06989a'),      # Cyan
            'ansi-7-hex': theme_data.get('colors', {}).get('white', '#d3d7cf'),     # Light Gray (White)
            'ansi-8-hex': theme_data.get('colors', {}).get('bright_black', '#555753'),  # Bright Black
            'ansi-9-hex': theme_data.get('colors', {}).get('bright_red', '#ef2929'),    # Bright Red
            'ansi-10-hex': theme_data.get('colors', {}).get('bright_green', '#8ae234'), # Bright Green
            'ansi-11-hex': theme_data.get('colors', {}).get('bright_yellow', '#fce94f'),# Bright Yellow
            'ansi-12-hex': theme_data.get('colors', {}).get('bright_blue', '#729fcf'),  # Bright Blue
            'ansi-13-hex': theme_data.get('colors', {}).get('bright_magenta', '#ad7fa8'),# Bright Magenta
            'ansi-14-hex': theme_data.get('colors', {}).get('bright_cyan', '#34e2e2'),  # Bright Cyan
            'ansi-15-hex': theme_data.get('colors', {}).get('bright_white', '#eeeeec'), # Bright White
            'foreground-hex': theme_data.get('foreground', '#d3d7cf'),  # Light Gray (Foreground)
            'background-hex': theme_data.get('background', '#2e3436'),  # Dark Gray (Background)
            'cursor-hex': theme_data.get('cursor', '#d3d7cf'),         # Light Gray (Cursor)
            'selection-hex': selection_hex,  # Medium Gray (Selection)
            'selection-text-hex': theme_data.get('selection_text', invert_hex_color(selection_hex))  # Inverted Selection
        })

    return context

def main():
    config_path = Path('templates/config.json')

    try:
        config = load_config(config_path)
    except Exception as e:
        print(f"Error loading config file {config_path}: {e}")
        return

    themes_base_dir = Path('themes')
    theme_sources = [d for d in themes_base_dir.iterdir() if d.is_dir()]

    if not theme_sources:
        print("No theme source directories found in themes/ directory.")
        return

    for source_dir in theme_sources:
        source_name = source_dir.name  # e.g., 'gogh', 'base16', 'base24', 'iterm'
        theme_files = sorted(
            glob.glob(str(source_dir / '*.yaml')) +
            glob.glob(str(source_dir / '*.yml')) +
            glob.glob(str(source_dir / '*.itermcolors'))
        )

        if not theme_files:
            print(f"No theme files found in {source_dir} directory.")
            continue

        for theme_file in theme_files:
            theme_path = Path(theme_file)
            if theme_path.suffix == '.itermcolors':
                theme_data = load_plist(theme_path)
                source_name = 'iterm'  # Override source for .itermcolors files
            else:
                theme_data = load_yaml(theme_path)
            if theme_data is None:
                continue

            # Map theme data to standard context based on source
            try:
                context = map_theme_data(theme_data, source_name, theme_path)
            except ValueError as e:
                print(f"Validation error for {theme_path}: {e}")
                continue

            # Normalize all -hex fields to lowercase
            for key in context:
                if key.endswith('-hex') and isinstance(context[key], str):
                    context[key] = context[key].lower()

            # Add the entire context as a JSON string
            context['theme-json'] = json.dumps(context, sort_keys=True, ensure_ascii=False, indent=4)

            for template_key, template_config in config.items():
                template_path = Path('templates') / template_key
                if not template_path.exists():
                    print(f"Template file {template_path} not found, skipping for theme {context['theme-name']}...")
                    continue

                try:
                    with open(template_path, 'r') as f:
                        template = f.read()
                except Exception as e:
                    print(f"Error reading template file {template_path}: {e}")
                    continue

                rendered = pystache.render(template, context)

                output_dir = Path(template_config['directory'])
                output_filename = pystache.render(template_config['filename'], context)
                output_path = 'build' / output_dir / output_filename

                try:
                    os.makedirs('build' / output_dir, exist_ok=True)
                except Exception as e:
                    print(f"Error creating output directory {output_dir}: {e}")
                    continue

                try:
                    with open(output_path, 'w') as f:
                        f.write(rendered)
                    print(f"Generated theme file for [{template_key}] [{context['theme-source']}] {context['theme-name']} at: {output_path}")
                except Exception as e:
                    print(f"Error writing output file {output_path}: {e}")

if __name__ == "__main__":
    main()
