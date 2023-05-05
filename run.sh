#!/bin/bash

docker run \
	--mount type=bind,source=/large_disk,target=/large_disk \
	--mount type=bind,source=/home/jry/source/,target=/jupyterlab/source \
	--rm \
	-it 55 \
	/bin/bash
