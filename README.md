# StudioController
Switching properly your home studio devices and speakers the proper way. Control record light sign too with OSC !

# Context
In my home studio, I wanted to get the audio device to be switched on and off automatically when my computer starts and stops.
I also wanted to get a record light to be switched on when I'm recording stuff.

This would both help me getting ride of manually switching on/off all the piece of audio hardware I have around and most of all, will handle the proper way/order of switching them on/off. E.g. when switching on, turn the audio interface, guitar pedals, etc and then finally turn on the speakers.

So I grabbed a set of 4 Chacon 54662 RF sockets, a XIAO ESP32C3 board and RF 433MHz ASK TX/RX boards (FS1000A transmitter and RF-5V receiver).

The record light sign is turned on/off using a solid state relay I had already. Since I could be recording/stopping, re-recording in a short period of time, I did not want to have a mechanical relay to turn the light on/off. That's why I did not use one the RF socket for that function.

Once everything plugged and after a few hours of trying to guess the RF protocol for the Chacon 54662 sockets, I came up with the code that's in this repo!

Enjoy !
