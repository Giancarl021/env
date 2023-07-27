USER=$SUDO_USER
HOME=$(getent passwd $USER | cut -d: -f6)
TMP_DIRECTORY="$HOME/.env.tmp"
ENV_DIRECTORY="$HOME/.env"
