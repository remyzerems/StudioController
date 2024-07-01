#!/bin/bash

if [ $# -eq 0 ]
  then
    # Send the switch off command to the required target. One might need to change /dev/ttyACM0 to match its own hardware (e.g. /dev/ttyUSB0)
    echo 'switch-sound-off' > /dev/ttyACM0
else
  if [ "$1" = "install" ]
    then
        echo 'Installing script so that it is run upon switch off'

        script_name=$(basename "$0")
        script_path=`realpath $script_name`

        service_file_content="[Unit]
Description=Pre-Shutdown Processes
DefaultDependencies=no
Before=shutdown.target
# This works because it is installed in the target and will be
#   executed before the target state is entered
# Also consider kexec.target

[Service]
Type=oneshot
ExecStart=$script_path

[Install]
WantedBy=halt.target reboot.target shutdown.target"
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



