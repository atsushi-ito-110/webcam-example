#!/bin/bash

DATE=`date '+%Y%m%d'`
DATETIME=`date '+%Y%m%d-%H%M-%S'`
WORK_DIR='/home/pi/projects/webcam-example'
aws s3api put-object --bucket webcam-example --content-type "image/jpeg" --key "$DATE/$DATETIME.jpg" --body "$WORK_DIR/screenshots/picture.jpg"
