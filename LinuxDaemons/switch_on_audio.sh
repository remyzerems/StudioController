#!/bin/bash

if [ $# -eq 0 ]
  then
    # Send the switch on command to the required target. One might need to change /dev/ttyACM0 to match its own hardware (e.g. /dev/ttyUSB0)
    echo 'switch-sound-on' > /dev/ttyACM0
else
  if [ "$1" = "install" ]
    then
        echo 'Installing script so that it is run upon booting'

        script_name=$(basename "$0")
        script_path=`realpath $script_name`


        service_file_content="[Unit]
Description=Service to check for external monitors during boot.

[Service]
Type=Simple
ExecStart=$script_path

[Install]
WantedBy=multi-user.target"
        echo "$service_file_content" > /etc/systemd/system/$script_name.service

        systemctl daemon-reload
        systemctl enable $script_name.service
        systemctl start $script_name.service
  fi

  if [ "$1" = "uninstall" ]
    then
        echo 'Uninstalling script'
        systemctl stop $script_name.service
        systemctl disable $script_name.service
        rm /etc/systemd/system/$script_name.service
        systemctl daemon-reload
  fi
fi
