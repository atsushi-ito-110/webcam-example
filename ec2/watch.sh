#!/bin/sh
WORK_DIR=/home/ec2-user/webcam-example
/usr/bin/inotifywait -m -e create "$WORK_DIR/screenshots" | while read line; do
  echo 'watch'
  DATETIME=`date '+%Y%m%d-%H%M-%S'`
  rm "$WORK_DIR/screenshots/picture.jpg"
  echo "$DATETIME" >> "$WORK_DIR/log/watch.log"
  #echo $line | tee -a /var/log/dirmon.log
  #dirmon_count=`cat /tmp/dirmon_count`
  #echo `expr $dirmon_count + 1` > /tmp/dirmon_count
done
