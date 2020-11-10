# syntax = docker/dockerfile:1.0-experimental

# Docker container for the CMSvision build environment on Linux x86_64
# Image: tobiashaenel/cmsvision-docker:linux-x64

FROM ubuntu:20.04
MAINTAINER Tobias Hänel <contact@tobias-haenel> (@tobiashaenel)

COPY init-install-packages.sh /tmp/init-install-packages.sh
RUN DEBIAN_FRONTEND=noninteractive /tmp/init-install-packages.sh

ENV QT_VERSION="5.15.2" \
    QT_BIN_PACKAGE="gcc_64" \
    QT_PATH="/opt/Qt"
ENV QT_DESKTOP="${QT_PATH}/${QT_VERSION}/${QT_BIN_PACKAGE}"
COPY init-prepare-qt.sh /tmp/init-prepare-qt.sh
RUN --mount=type=secret,id=qt_secrets /tmp/init-prepare-qt.sh

COPY init-prepare-linuxdeploy.sh /tmp/init-prepare-linuxdeploy.sh
RUN /tmp/init-prepare-linuxdeploy.sh

COPY init-prepare-hdf5.sh /tmp/init-prepare-hdf5.sh
RUN /tmp/init-prepare-hdf5.sh

COPY init-prepare-glm.sh /tmp/init-prepare-glm.sh
RUN /tmp/init-prepare-glm.sh

# Add group & user + sudo
RUN groupadd -r user && useradd --create-home --gid user user && echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user
USER user
WORKDIR /home/user
ENV HOME /home/user
