function update_packages() {
  apt-get update
  apt-get upgrade --yes
  apt-get auto-remove --yes
  apt-get clean
}

function fatal_error() {
  log "$1"
  exit -1
}

function log() {
  echo "[$SCRIPT_CONTEXT] $1"
}

