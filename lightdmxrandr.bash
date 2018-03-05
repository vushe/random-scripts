#!/bin/bash

# USAGE:
#
# 1. This script to be copied to /etc/lightdm/
#
# 2. Make this script executable:
#       sudo chmod +x ./lightdmxrandr.bash
#
# 3. In the end of /etc/lightdm/lightdm.conf add following line:
#       display-setup-script=/etc/lightdm/lightdmxrandr.bash
#

# List of possible secondary displays
secondary_displays=(DP1 DP2 DP2-1 DP2-2 DP2-3 HDMI1 HDMI2)

for my_display in ${secondary_displays[*]}
do

  echo $my_display
  # if at least one letter is before the display name, this is not the display in question
  prev="$(xrandr -q|grep -oP ".{0,1}${my_display}")"

  if [ "${prev}" == "$my_display" ]; then

    mode="$(xrandr -q|grep -A1 "${my_display} connected"| tail -1 |awk '{ print $1 }')"

    # if mode has been detected, cycle is over
    if [ ! -e $mode ]; then

        # External display
        #xrandr --output $my_display --mode 1920x1080

        if [ -z $first ]; then
            xrandr --output $my_display --primary --auto
            # Laptop -- for some reason resolution change is not working when laptop screen is on
            xrandr --output eDP1 --off
            first=1
        else
            xrandr --output $my_display --auto
        fi

        #echo $my_display > $cfg_file

        #break
    fi
  fi
done
