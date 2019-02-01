the branch <code>_store1_</code> is used for storage of the experiments for now.

<code>"Integrated Camera"</code> is usually the PC-own webcam (Lenovo/IBM),
<code>"USB Camera"</code> is any other connected-camera.
for audio resources look for something like <code>"Internal Microphone (Conexant 2"</code>.

<hr/>
example commands and output (shorten)
<pre>
ffmpeg -y -hide_banner -loglevel "info"   -list_devices true -f dshow -i dummy

DirectShow video devices (some may be both video and audio devices)
 "Integrated Camera"
    Alternative name "@device_pnp_\\?\usb#vid_04f2&pid_b217...}\global"
 "USB Camera"
    Alternative name "@device_pnp_\\?\usb#vid_0bda&pid_5801&mi_00#9&...}\global"
DirectShow audio devices
 "Internal Microphone (Conexant 2"
    Alternative name "@device_cm_{...}\Internal Microphone (Conexant 2"
dummy: Immediate exit requested
</pre>
<hr/>

<code>Integrated Camera</code> formats are something like that:
<pre>
</pre>

<code>USB Camera</code> formats are something like that:
<pre>
DirectShow video device options (from video devices)
 Pin "Capture" (alternative pin name "0")
  pixel_format=yuyv422  min s=640x480 fps=15 max s=640x480 fps=30
  pixel_format=yuyv422  min s=640x480 fps=15 max s=640x480 fps=30
  pixel_format=yuyv422  min s=160x120 fps=15 max s=160x120 fps=30
  pixel_format=yuyv422  min s=160x120 fps=15 max s=160x120 fps=30
  pixel_format=yuyv422  min s=176x144 fps=15 max s=176x144 fps=30
  pixel_format=yuyv422  min s=176x144 fps=15 max s=176x144 fps=30
  pixel_format=yuyv422  min s=320x240 fps=15 max s=320x240 fps=30
  pixel_format=yuyv422  min s=320x240 fps=15 max s=320x240 fps=30
  pixel_format=yuyv422  min s=352x288 fps=15 max s=352x288 fps=30
  pixel_format=yuyv422  min s=352x288 fps=15 max s=352x288 fps=30
</pre>

<hr/>

<h3>How to set and forget?</h3>
create two "scheduled tasks" using <code>C:\Windows\System32\mmc.exe "C:\Windows\system32\taskschd.msc" /s</code>, 
the first one for <code>ffmpeg_webcam_image_save_to_PNG_using_the_ISO_IMG_filename_format___faster___with_timestamp_overlay___USB_Camera.cmd</code> - set it to run every 1 minute (change 5 minutes min. to 1 minute manually), the second one for <code>compress_jpg_to_zip_and_push_to_git.cmd</code> to run every 5 (or 10) minutes.

"disable" the two tasks until you'll need them.