INSTALL_DIR="/server"

install() {
    steamcmd \
        +force_install_dir "$INSTALL_DIR" \
        +login anonymous \
        +app_update 380870 \
        +quit
}

start() {
    "$INSTALL_DIR/start-server.sh" \
        -cachedir="/zomboid" \
        -adminpassword "$PZ_ADMIN_PASSWORD" \
        -port "16261" \
        -servername "$PZ_SERVER_NAME"
}

install
start