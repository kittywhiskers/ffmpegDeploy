## ffmpegDeploy

A live example of using `ffmpegLoopVideo.sh` with YouTube to deliver a high quality stream for no good reason.

### Asset Generation Script

`ffmpeg  -stream_loop -1 -i ./assets/Record_Spinning_Rack_Focus_2.mp4 -c copy -v 0 -f nut - | ffmpeg -thread_queue_size 100K -i - -i ./assets/Lift\ Yourself\ but\ lo-fi\'ed.mp3 -t $(sox ./assets/Lift\ Yourself\ but\ lo-fi\'ed.mp3 -n stat 2>&1 | sed -n 's#^Length (seconds):[^0-9]*\([0-9.]*\)$#\1#p') -c copy -map 0:v -map 1:a -shortest -y ./assets/deployedStream.mp4`

Source: [ffmpeg: Loop video to the length of audio](https://video.stackexchange.com/a/23394)

### Additional Source

[Penguin Vector Image Source](https://4vector.com/free-vector/dancing-penguins-99210)
