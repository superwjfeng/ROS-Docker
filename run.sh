#!/bin/bash

pushd docker
    pushd docker_build
        ./build_pub.sh
        # ./build_sub.sh
    popd
    pushd scripts
        ./docker_run.sh
        ./docker_into.sh
    popd
popd