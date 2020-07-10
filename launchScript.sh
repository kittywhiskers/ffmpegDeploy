#!/usr/bin/env bash

export PATH=$PWD/ffmpegBins:$PATH

chmod +x ./ffmpegBins/ffmpeg
# deployedStream generation example code
ffmpeg -rtbufsize 100M -stream_loop -1 -i ./assets/Record_Spinning_Rack_Focus_2.mp4 \
  -c copy -v 0 -f nut - | ffmpeg -thread_queue_size 100K -i - -i ./assets/sampleAudio.mp3 \
  -c copy -map 0:v -map 1:a -shortest -y ./assets/deployedStream.mp4
# Start streaming in the background and show us it is doing the job
$PWD/ffmpegScripts/ffmpegLoopStream.sh $PWD/assets/deployedStream.mp4 20 720 $SITE_ACCESS_KEY veryfast 26 &
jobs
# Start PHP server
vendor/bin/heroku-php-apache2
