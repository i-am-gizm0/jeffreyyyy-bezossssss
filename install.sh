echo Installing mpg123
apt install mpg123

echo Installing youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl

echo Installing FFmpeg
apt install ffmpeg

echo Getting audio from youtube
youtube-dl -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=7_EeCkHs-e0 -o bezos.mp3