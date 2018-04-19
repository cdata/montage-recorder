#!/bin/bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
output_folder="./"
start_index=0
time_interval=5
delay=0

while getopts "o:i:t:yd:" opt; do
  case "$opt" in
    o)  output_folder=$OPTARG
      ;;
    i)  start_index=$OPTARG
      ;;
    t)  time_interval=$OPTARG
      ;;
    y)  force_start=1
      ;;
    d)  delay=$OPTARG
  esac
done

echo "This script records screenshots at regular intervals to a folder"

echo "Montage recorder configuration:"
echo " - Output folder (o): $output_folder"
echo " - Start index   (i): $start_index"
echo " - Time interval (t): $time_interval"
echo " - Delay         (d): $delay"

shift $((OPTIND-1))

if [ -z ${force_start+x} ]; then
  read -r -p "Looks good? [y/N] " response

  if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    exit 1
  fi
fi

sleep $delay

recorded=$start_index

mkdir -p $output_folder

while true
do
  recorded=$(($recorded+1))
  screencapture -x "$output_folder/$recorded.png"
  echo "Recorded screenshot $recorded to $output_folder"
  sleep $time_interval
done
