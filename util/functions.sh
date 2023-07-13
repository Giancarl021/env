function update_packages() {
  apt-get update > /dev/null
  apt-get upgrade --yes > /dev/null
  apt-get auto-remove --yes > /dev/null
  apt-get clean > /dev/null
}

function fatal_error() {
  log "$1"
  exit -1
}

function log() {
  echo "[$SCRIPT_CONTEXT] $1"
}

