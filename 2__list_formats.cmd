::-----------this is IBM/Lenovo own (on-screen) integrated camera
::ffmpeg -y -hide_banner -loglevel "info"   -f dshow -list_options true -i video="Integrated Camera"


::-----------this is a generic "long-cable" 0.3M-Pixel USB-Camera.
::ffmpeg -y -hide_banner -loglevel "info"   -f dshow -list_options true -i video="USB Camera"


::-----------this is a PC-WebCam (USB).
ffmpeg -y -hide_banner -loglevel "info"   -f dshow -list_options true -i video="USB Video Device"
pause