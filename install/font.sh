FONT_NAME="JetBrains Mono"
FONT_DIR="jetbrains-mono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip"

log "Installing the Nerd Font $FONT_NAME..."

FONT_DIRECTORY="$TMP_DIRECTORY/font"
FONT_PATH="$FONT_DIRECTORY/nerd-font.zip"
DESTINATION_DIRECTORY="/usr/share/fonts/truetype/$FONT_DIR"

mkdir -p "$FONT_DIRECTORY"
mkdir -p "$DESTINATION_DIRECTORY"

log "Downloading font $FONT_NAME..."

curl -sL "$FONT_URL" -o "$FONT_PATH"

log "Extracting font $FONT_NAME..."

unzip -o -q $FONT_PATH -d "$FONT_DIRECTORY"

log "Copying font $FONT_NAME to system fonts directory..."

sudo yes | cp "$FONT_DIRECTORY"/*.ttf "$DESTINATION_DIRECTORY"

log "Removing remanescent files..."

rm -rf $FONT_DIRECTORY

if [[ "$(command -v fc-cache)" ]]
then
  log "Reseting the system font cache..."
  sudo fc-cache -fv
fi

log "Font $FONT_NAME installed on your system!"
