#!/bin/bash
WALLPAPER_DIR="$HOME/.config/wallpapers/.root"
ROFI_THEME_FILE="$HOME/.cache/wal/colors-rofi-dark.rasi"
DEST_DIR="$HOME/.config/hypr/currentWallpaper"

# Cambia directory per facilitare il percorso
cd "$WALLPAPER_DIR"

# Crea lista con icone per rofi
WALLPAPER_LIST=""
for img in *.jpg *.jpeg *.png; do
    [ -f "$img" ] || continue
    WALLPAPER_LIST+="$img\0icon\x1f$WALLPAPER_DIR/$img\n"
done

# Mostra rofi con anteprime centrate e uniformi
SELECTED_FILENAME=$(echo -en "$WALLPAPER_LIST" | rofi -dmenu \
                    -i \
                    -p "Select a wallpaper" \
                    -config "$ROFI_THEME_FILE" \
                    -show-icons \
                    -theme-str 'element { orientation: vertical; padding: 10px; }' \
                    -theme-str 'element-icon { size: 25%; horizontal-align: 0.5; vertical-align: 0.5; }' \
                    -theme-str 'element-text { enabled: false; }' \
                    -theme-str 'listview { columns: 3; lines: 3; spacing: 3px; fixed-columns: true; flow: horizontal; }')

if [ -z "$SELECTED_FILENAME" ]; then
    echo "Selezione annullata."
    exit 0
fi

SELECTED_FILE="$WALLPAPER_DIR/$SELECTED_FILENAME"

/usr/bin/swww img "$SELECTED_FILE" \
    --transition-type "fade" \
    --transition-duration 3 \
    --transition-fps 60

pkill swaync 
swaync & 
wal -i "$SELECTED_FILE"
# --- End of Script ---
