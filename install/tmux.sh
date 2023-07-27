INSTALL_TMUX_PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

log "Installing tmux..."

apt-get install tmux --yes

TMUX_CONFIG_DIRECTORY="$HOME/.config/tmux"

mkdir -p "$TMUX_CONFIG_DIRECTORY"

yes | cp "$INSTALL_TMUX_PARENT_PATH/../config/tmux/tmux.conf" "$TMUX_CONFIG_DIRECTORY"

git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

log "TMUX and it's dependencies installed"
