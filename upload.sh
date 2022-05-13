#!/usr/bin/bash -l

echo "upload.sh"
DATE=`date '+%Y%m%d'`
DATETIME=`date '+%Y%m%d-%H%M-%S'`
echo "$DATETIME"
WORK_DIR='/home/pi/projects/webcam-example'
# aws s3api put-object --bucket webcam-example --content-type "image/jpeg" --key "$DATE/$DATETIME.jpg" --body "$WORK_DIR/screenshots/picture.jpg"
echo "ec2ip $EC2IP"
scp -i /home/pi/.ssh/anpi/anpi-key-pair.pem "$WORK_DIR/screenshots/picture.jpg" "ec2-user@$EC2IP:pictures/$DATETIME.jpg"
