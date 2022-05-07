#!/bin/bash

ffmpeg -i http://ito:110@192.168.0.4:8080/?action=stream -t 10 videos/output.mp4
