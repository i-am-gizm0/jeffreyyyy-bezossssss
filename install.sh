echo Installing mpg123
apt install mpg123 -y

echo Installing youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl

echo Installing FFmpeg
apt install ffmpeg -y

echo Getting audio from youtube
youtube-dl -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=ebkAM2_zsEk -o "bezos.%(ext)s"
