#!/bin/bash

WORK_DIR='/home/ec2-user/webcam-example'
LOG_FILE="$WORK_DIR/log/watch.log"
/usr/bin/inotifywait -m -e create "$WORK_DIR/screenshots" | while read line; do
  echo "Start watch" >> "$LOG_FILE"
  DATETIME=`date '+%Y%m%d-%H%M-%S'`
  echo "$DATETIME" >> "$LOG_FILE"
  sh "$WORK_DIR/ec2/upload.sh" >> "$LOG_FILE"
  rm "$WORK_DIR/screenshots/picture.jpg"
done
