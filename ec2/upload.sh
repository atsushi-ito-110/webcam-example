#!/usr/bin/bash -l

echo "upload.sh"
DATE=`date '+%Y%m%d'`
DATETIME=`date '+%Y%m%d-%H%M-%S'`
echo "$DATETIME"
WORK_DIR='/home/ec2-user/webcam-example'
aws s3api put-object --bucket webcam-example --content-type "image/jpeg" --key "$DATE/$DATETIME.jpg" --body "$WORK_DIR/screenshots/picture.jpg"
