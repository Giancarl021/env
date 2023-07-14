USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
TMP_DIRECTORY="$USER_HOME/.env.tmp"
ENV_DIRECTORY="$USER_HOME/.env"
