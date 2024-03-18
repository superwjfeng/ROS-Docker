#!/bin/bash

IMAGE_NAME="ros2:subscriber"

docker build -t ${IMAGE_NAME} --network host -f sub.dockerfile .