#!/bin/bash

if [ -e /opt/lampp/manager-linux.run ]; then
    gksudo /opt/lampp/manager-linux.run
else
    gksudo /opt/lampp/manager-linux-x64.run
fi
