#!/bin/bash

docker run \
	--mount type=bind,source=/large_disk,target=/large_disk \
	--mount type=bind,source=/home/jry/source/,target=/jupyterlab/source \
	--gpus all \
	-p 4444:4444 \
	-it tf-opencv:latest 
	
