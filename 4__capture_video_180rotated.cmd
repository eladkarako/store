@echo off
::for when your camera is upside-down.
set "ARGS="
set  ARGS=%ARGS% -y -hide_banner -loglevel "info" -strict "experimental"
set  ARGS=%ARGS% -rtbufsize 200M
set  ARGS=%ARGS% -f dshow 
::------------------------------------------------------------------------------------------video source arguments - need to use a format that is supported (query all devices and then your selected-device's formats).  -- when switching, uncomment the two-lines.
::set  ARGS=%ARGS% -video_size "1280x720" -framerate "10.0" -pixel_format "yuyv422"  -i video="Integrated Camera"
::set  ARGS=%ARGS% -video_size "640x480"  -framerate "15.0" -pixel_format "yuyv422"  -i video="USB Camera"
set  ARGS=%ARGS% -video_size "640x480"  -framerate "30.0" -pixel_format "yuyv422"  -i video="USB Video Device"

::------------------------------------------------------------------------------------------explicitly avoiding other streams but video.
set  ARGS=%ARGS% -an -sn
set  ARGS=%ARGS% -vf "transpose=cclock,transpose=cclock"


set "D=%DATE%"
set "T=%TIME%"
set "YEAR=%D:~-4,4%"
set "MONTH=%D:~-10,2%"
set "DAY=%D:~-7,2%"
set "HOURS=%T:~0,2%"
set "MINUTES=%T:~3,2%"
set "SECONDS=%T:~6,2%"
set "TIMESTAMP=%YEAR%%MONTH%%DAY%_%HOURS%%MINUTES%%SECONDS%"
set "FILENAME=%~sdp0VID_%TIMESTAMP%.mp4"

set  ARGS=%ARGS% "%FILENAME%"

echo.
echo ffmpeg %ARGS%    1>&2
echo.
call ffmpeg %ARGS%
echo.

pause

