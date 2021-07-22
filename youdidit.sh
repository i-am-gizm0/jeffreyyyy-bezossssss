if ! (locate mpg123) || ! (locate youtube-dl) || ! (locate ffmpeg) || ! [ -f "bezos.mp3"]; then
    ./install.sh
fi

if docker ps | grep pihole; then
    # Pihole is running in a container
    GET_LOGS_CMD="docker exec pihole -t | grep --line-buffered device-metrics-us.amazon.com"
elif locate pihole; then
    # Pihole is installed
    GET_LOGS_CMD="pihole -t | grep --line-buffered device-metrics-us.amazon.com"
else
    # Pihole is not installed
    echo "Pihole is not installed"
    exit 1
fi

exec "$GET_LOGS_CMD" | (
    while read -r line; do
        # Play
        mpg123 bezos.mp3 &
    done
)