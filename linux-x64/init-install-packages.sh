#!/usr/bin/sh

set -e
set -x

# install dependencies
apt-get update
apt-get full-upgrade -y
apt-get install -y --no-install-recommends \
    automake \
    build-essential \
    ca-certificates \
    curl \
    desktop-file-utils \
    fuse \
    git \
    libcairo2-dev \
    libdbus-1-3 \
    libfontconfig1 \
    libfuse-dev \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libice6 \
    libsm6 \
    libtool \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-keysyms1-dev \
    libxcb-randr0-dev \
    libxcb-render-util0-dev \
    libxcb-shape0-dev \
    libxcb-xinerama0-dev \
    libxext6 \
    libxkbcommon-x11-0 \
    libxrender1 \
    locales \
    openssh-client \
    pkg-config \
    sudo \
    wget \
    xvfb \
    xxd \
    zlib1g-dev
apt-get -qq clean
rm -rf /var/lib/apt/lists/*

# reconfigure locales
locale-gen en_US.UTF-8
dpkg-reconfigure locales
