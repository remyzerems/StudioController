#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No argument found"
else
  if [ "$1" = "install" ]
    then
        echo 'Installing daemons to switch on/off when booting/shuting down computer'

        sh switch_on_audio.sh install
        sh switch_off_audio.sh install
  fi
  if [ "$1" = "uninstall" ]
    then
        echo 'Uninstalling daemons to switch on/off when booting/shuting down computer'

        sh switch_on_audio.sh uninstall
        sh switch_off_audio.sh uninstall
  fi

  if [ "$1" = "on" ]
    then
        echo 'Switching audio system ON'

        sh switch_on_audio.sh
  fi
  if [ "$1" = "off" ]
    then
        echo 'Switching audio system OFF'

        sh switch_off_audio.sh
  fi

  if [ "$1" = "tally-on" ]
    then
        echo 'Switching tally light ON'

        # Send the switch on command to the required target. One might need to change /dev/ttyACM0 to match its own hardware (e.g. /dev/ttyUSB0)
        echo 'switch-tally-on' > /dev/ttyACM0
  fi
  if [ "$1" = "tally-off" ]
    then
        echo 'Switching tally light OFF'

        # Send the switch off command to the required target. One might need to change /dev/ttyACM0 to match its own hardware (e.g. /dev/ttyUSB0)
        echo 'switch-tally-off' > /dev/ttyACM0
  fi
fi
