#!/bin/bash

WALLPAPER_DIR="$HOME/.config/wallpapers/.root"
ROFI_THEME_FILE="$HOME/.cache/wal/colors-rofi-dark.rasi"
DEST_DIR="$HOME/.config/hypr/currentWallpaper"


WALLPAPER_LIST=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | sed "s|$WALLPAPER_DIR/||g")

SELECTED_FILENAME=$(echo -e "$WALLPAPER_LIST" | rofi -dmenu \
                    -i \
                    -p "Scegli Sfondo" \
                    -config "$ROFI_THEME_FILE"
                    )

if [ -z "$SELECTED_FILENAME" ]; then
    echo "Selezione annullata."
    exit 0
fi

SELECTED_FILE="$WALLPAPER_DIR/$SELECTED_FILENAME"


/usr/bin/swww img "$SELECTED_FILE" \
    --transition-type "center" \
    --transition-duration 5 \
    --transition-fps 60

pkill swaync & swaync & wal -i "$SELECTED_FILE"

# --- End of Script ---
