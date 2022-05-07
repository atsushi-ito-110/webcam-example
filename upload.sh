#!/bin/bash

DATE=`date '+%Y%m%d'`
DATETIME=`date '+%Y%m%d-%H%M-%S'`
aws s3api put-object --bucket webcam-example --content-type "image/jpeg" --key "$DATE/$DATETIME.jpg" --body screenshots/picture.jpg
