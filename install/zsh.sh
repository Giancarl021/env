INSTALL_ZSH_PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

log "Installing ZSH..."

apt-get install zsh --yes

chsh -s "$(which zsh)" $SUDO_USER

yes | cp "$INSTALL_ZSH_PARENT_PATH/../config/.zshrc" "$USER_HOME/.zshrc"

log "Installing Oh My ZSH! framework..."

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -s -- --unattended

log "Installing Spaceship theme..."

ZSH_CUSTOM="$HOME/.oh-my-zsh"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

log "Installing ZInit plugin manager..."

NO_INPUT=true NO_EDIT=true bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

log "ZSH and it's dependencies installed"
