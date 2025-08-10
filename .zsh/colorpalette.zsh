colorpallete() {
  # Get number of colors using echotc Co
  num_colors=$(echotc Co 2>/dev/null)
  if [[ $? -ne 0 || -z "$num_colors" ]]; then
    echo "Error: Unable to retrieve number of colors with echotc Co"
    exit 1
  fi

  # Function to print 16-color palette samples
  print_color_sample() {
    local color=$1
    local type=$2
    local code
    # ANSI color names for 0-15 (standard and bright)
    local color_names=("Black" "Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White"
                       "Bright Black" "Bright Red" "Bright Green" "Bright Yellow" "Bright Blue" "Bright Magenta" "Bright Cyan" "Bright White")
    local label="${color_names[$color + 1]}"

    if [[ $type == "fg" ]]; then
      if [[ $color -le 7 ]]; then
        code=$((30 + $color))
      else
        code=$((90 + $color - 8))
      fi
    else
      if [[ $color -le 7 ]]; then
        code=$((40 + $color))
      else
        code=$((100 + $color - 8))
      fi
    fi

    if [[ $type == "bg" && $color -ne 0 ]]; then
      printf "\e[${code}m\e[30m%-16s\e[0m" "$label"
    else
      printf "\e[${code}m%-16s\e[0m" "$label"
    fi
  }

  # Function to print 256-color palette samples
  print_256_color_sample() {
    for i in {0..255}; do
      ((i==232)) && printf "\e[0m\n"
      ((i==244)) && printf "\e[0m\n"
      printf "\e[48;5;%dm%3d " $i $i
      (((i+3) % 18)) || ((i>232))|| printf "\e[0m\n"
    done
    printf "\e[0m\n"
  }

  # Function to print true color gradient samples
  print_true_color_gradient() {
    local steps=$1
    for ((i = 0; i < steps; i++)); do
      # Linear interpolation from red (255,0,0) to green (0,255,0)
      local r=$(( (255 * (steps - i - 1)) / steps ))
      local g=$(( (255 * i) / steps ))
      local b=0
      printf "\e[48;2;${r};${g};${b}m\e[38;2;${r};${g};${b}m%-1s\e[0m" "X"
    done
    echo  # New line after gradient
  }

  # Print 16-color palette
  echo "\n=== Standard 16-Color Palette (8 basic + 8 bright) ==="
  echo "Foreground Colors (0–15):"
  for ((color = 0; color < 16; color++)); do
    print_color_sample $color "fg"
    if [[ $((color % 4)) -eq $((4 - 1)) ]]; then
      echo
    fi
  done

  echo "\nBackground Colors (0–15):"
  for ((color = 0; color < 16; color++)); do
    print_color_sample $color "bg"
    if [[ $((color % 4)) -eq $((4 - 1)) ]]; then
      echo
    fi
  done

  # Print 256-color palette if supported
  if [[ $num_colors -ge 256 ]]; then
    echo "\n=== 256-Color Palette ==="
    print_256_color_sample
  fi

  # Print true color gradient if supported
  if [[ "$COLORTERM" == "truecolor" ]]; then
    echo "\n=== True Color (24-bit) Gradient Test ==="
    print_true_color_gradient 72
  fi

  # Reset terminal colors
  echo -n "\e[0m"
  echo
}
