#!/bin/bash

AFLROOT="/home/yuroc/workspace/protocol/tools/fuzz_target"
FILE="~/tmp/prepacket"
PACKETID=1
AFLCMD="$AFLROOT/auto.bash $PACKETID 1"

while true
do
$AFLCMD
if [ -e $FILE ]
then
let "PACKETID=PACKETID+1"
$AFLCMD
fi
done
