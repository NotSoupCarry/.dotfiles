#!/bin/bash

swaync-client -t -sw

if [[ -z $(eww active-windows | grep 'usrctl') ]]; then
  eww open usrctl
  eww update ctlrev=true
else
  eww update ctlrev=false
  (eww close usrctl) &
fi
