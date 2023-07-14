log "Installing NVM..."

PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This load nvm

log "Installing latest LTS Node version..."

nvm install --lts
nvm use --lts
npm install --global npm@latest pnpm@latest yarn@latest serve@latest typescript@latest ts-node@latest

log "NVM and it's dependencies installed"
