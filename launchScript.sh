#!/usr/bin/env bash

bash $PWD/generateAsset.sh
nohup bash $PWD/ffmpegScripts/ffmpegLoopStream.sh $PWD/assets/deployedStream.mp4 24 2160 $SITE_ACCESS_KEY & disown
vendor/bin/heroku-php-apache2
