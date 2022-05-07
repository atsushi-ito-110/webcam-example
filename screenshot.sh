#!/bin/bash

WORK_DIR=/home/pi/projects/webcam-example
wget -O "$WORK_DIR/screenshots/picture.jpg" http://ito:110@localhost:8080/?action=snapshot
