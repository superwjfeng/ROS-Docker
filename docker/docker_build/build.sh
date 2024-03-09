#!/bin/bash

IMAGE_NAME="ros2:learn"

docker build -t ${IMAGE_NAME} --network host -f base.dockerfile .