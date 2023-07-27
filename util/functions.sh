function update_packages() {
  sudo apt-get update
  sudo apt-get upgrade --yes
  sudo apt-get auto-remove --yes
  sudo apt-get clean
}

function fatal_error() {
  log "$1"
  exit -1
}

function log() {
  echo "[$SCRIPT_CONTEXT] $1"
}

