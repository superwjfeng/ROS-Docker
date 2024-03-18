#!/bin/bash

IMAGE_NAME="ros2:publisher"

docker build -t ${IMAGE_NAME} --network host -f pub.dockerfile .