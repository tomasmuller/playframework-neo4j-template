#!/bin/bash

if [ -f $PLAY_PID ]
then
echo "Found pid file $PLAY_PID, stopping play"
$PLAY_HOME/play stop $PLAY_APP --pid_file=$PLAY_PID
else
echo "Couldn't find pid file $PLAY_PID, can't stop play"
fi

