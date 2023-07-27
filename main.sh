SCRIPT_CONTEXT="GIANCARL021:ENVIRONMENT/CREATE"
ROOT_PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

source "$ROOT_PARENT_PATH/util/functions.sh"
source "$ROOT_PARENT_PATH/util/functions.sh"
source "$ROOT_PARENT_PATH/util/globals.sh"

if [[ $(id -u) -ne 0 ]]
then
  fatal_error "This script must be ran as 'root'"
fi

log 'Starting environment installation process...'

log "Updating APT packages..."

update_packages

mkdir -p "$TMP_DIRECTORY"
mkdir -p "$ENV_DIRECTORY"

log "Temporary directory created at $TMP_DIRECTORY"
log "Enviroment directory created at $ENV_DIRECTORY"

INSTALLATION_FILES=(
  "font"
  "bat"
  "imagemagick"
  "python"
  "zsh"
  "tmux"
  "thefuck"
  "nvm"
  "autojump"
)

for $FILE in ${INSTALLATION_FILES[@]}
do
  source "$ROOT_PARENT_PATH/install/$FILE.sh"
done

log "Removing temporary directory at $TMP_DIRECTORY..."

rm -rf "$TMP_DIRECTORY"

log "Enviroment set up successfully!"
