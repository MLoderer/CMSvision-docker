#!/usr/bin/bash

set -e
set -x

docker run \
    --interactive \
    --tty \
    --rm \
    --device /dev/fuse \
    --cap-add SYS_ADMIN \
    --security-opt apparmor:unconfined \
    tobiashaenel/cmsvision-docker:linux-x64 \
    bash
