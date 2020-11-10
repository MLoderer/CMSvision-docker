#!/usr/bin/bash

set -e
set -x

DOCKER_BUILDKIT=1 docker build \
    --tag=tobiashaenel/cmsvision-docker:linux-x64 \
    --secret=id=qt_secrets,src=../qt_secrets \
    .
