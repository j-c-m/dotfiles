#!/usr/bin/env bash

# Get the space ID from the signal
SPACE_ID="$1"

# Check if the created space is in native fullscreen
IS_FULLSCREEN=$(yabai -m query --spaces --space "$SPACE_ID" | jq '."is-native-fullscreen"')

if [ "$IS_FULLSCREEN" = "true" ]; then
  # Get the index of the last space
  LAST_SPACE_INDEX=$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')

  # Move the fullscreen space to the last index
  yabai -m space "$SPACE_ID" --move "$LAST_SPACE_INDEX"
fi
