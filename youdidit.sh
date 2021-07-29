# if ! (locate mpg123) || ! [`youtube-dl; echo $?` -eq 2] || ! (locate ffmpeg) || ! [ -f "bezos.mp3"]; then
#     sudo ./install.sh
# fi

#if docker ps | grep pihole; then
#    # Pihole is running in a container
#    GET_LOGS_CMD="docker exec pihole -t | grep --line-buffered device-metrics-us.amazon.com"
#elif locate pihole; then
#    # Pihole is installed
#    GET_LOGS_CMD="pihole -t | grep --line-buffered device-metrics-us.amazon.com"
#else
#    # Pihole is not installed
#    echo "Pihole is not installed"
#    exit 1
#fi

# exec "$GET_LOGS_CMD"
docker exec pihole pihole -t | grep --line-buffered device-metrics-us.amazon.com | (
    while read -r line; do
        # Play
        mpg123 bezos.mp3 &
        # Consider swapping out the mpg123 call for a cURL request to trigger the song playing on your smart speaker
    done
)
