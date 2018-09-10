::ffmpeg -y -hide_banner -loglevel "info"   -f dshow -list_options true -i video="Integrated Camera"
ffmpeg -y -hide_banner -loglevel "info"   -f dshow -list_options true -i video="USB Camera"
pause