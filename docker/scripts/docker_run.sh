#!/bin/bash

# PROJECT_SOURCE_CODE="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../grpc_examples" && pwd )"

CONTAINER_NAME=test
IMAGE_NAME=ros2:learn

echo "stop and rm exist docker container"
docker stop ${CONTAINER_NAME} > /dev/null
docker rm -f -v ${CONTAINER_NAME} > /dev/null

# echo "start docker container"
# docker run -it -d \
# --network host \
# --name ${CONTAINER_NAME} \
# ${IMAGE_NAME}

echo "start docker container"
docker run -it -d \
--network host \
--name ${CONTAINER_NAME} \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY \
-e GDK_SCALE \
-e GDK_DPI_SCALE \
${IMAGE_NAME} \


# -v ${PROJECT_SOURCE_CODE}:/workspace \