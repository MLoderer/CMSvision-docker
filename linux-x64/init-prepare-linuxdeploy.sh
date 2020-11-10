#!/usr/bin/sh

set -e
set -x

# Install linuxdeployqt AppImage
LINUXDEPLOY_APPIMAGE_URL="https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage"
LINUXDEPLOY_PLUGIN_QT_APPIMAGE_URL="https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage"
#   Create install directory
mkdir -p /tmp/linuxdeploy
cd /tmp/linuxdeploy
#  Download AppImages
curl -O -L "${LINUXDEPLOY_APPIMAGE_URL}"
curl -O -L "${LINUXDEPLOY_PLUGIN_QT_APPIMAGE_URL}"
chmod +x *.AppImage
#  Install appimage
mv *.AppImage /usr/local/bin
#  Cleaning install files
cd /
rm -rf /tmp/linuxdeploy
