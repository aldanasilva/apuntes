import os
from os.path import expanduser

path = expanduser("~") + "/.config/pulse/default.pa"
# https://stackoverflow.com/questions/4028904/how-to-get-the-home-directory-in-python

content = """.include /etc/pulse/default.pa
.nofail
unload-module module-suspend-on-idle
.fail"""

with open(path, "w") as file:
    file.write(content)

os.system("pulseaudio -k")
os.system("pulseaudio --start")

print("pulseaudio configured")

# PulseAudio - Troubleshooting - Pops when starting and stopping playback
# https://wiki.archlinux.org/index.php/PulseAudio/Troubleshooting#Pops_when_starting_and_stopping_playback