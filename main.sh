SCRIPT_CONTEXT="GIANCARL021:ENVIRONMENT/CREATE"
source ./util/functions.sh
source ./util/globals.sh

if [[ $(id -u) -ne 0 ]]
then
  fatal_error "This script must be ran as 'root'"
fi

log 'Starting environment installation process...'

log 'Updating APT packages...'

update_packages

mkdir -p "$TMP_DIRECTORY"

log "Temporary directory created at $TMP_DIRECTORY"

source ./install/font.sh


log "Removing temporary directory at $TMP_DIRECTORY..."

rm -rf "$TMP_DIRECTORY"

log "Enviroment set up successfully!"
