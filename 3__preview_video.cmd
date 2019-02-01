@echo off
set "ARGS="
set  ARGS=%ARGS% -hide_banner -loglevel "info" -strict "experimental"
set  ARGS=%ARGS% -rtbufsize 200M
set  ARGS=%ARGS% -f dshow 
::------------------------------------------------------------------------------------------video source arguments - need to use a format that is supported (query all devices and then your selected-device's formats).  -- when switching, uncomment the two-lines.
::set  ARGS=%ARGS% -video_size "1280x720" -framerate "10.0" -pixel_format "yuyv422"  -i video="Integrated Camera"
::set  ARGS=%ARGS% -video_size "640x480"  -framerate "15.0" -pixel_format "yuyv422"  -i video="USB Camera"
set  ARGS=%ARGS% -video_size "640x480"  -framerate "30.0" -pixel_format "yuyv422"  -i video="USB Video Device"

::------------------------------------------------------------------------------------------explicitly avoiding other streams but video.
set  ARGS=%ARGS% -an -sn

echo.
echo ffplay %ARGS%    1>&2
echo.
call ffplay %ARGS%
echo.

pause
