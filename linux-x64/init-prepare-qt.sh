#!/usr/bin/sh

set -e
set -x

# load secrets
. /run/secrets/qt_secrets

# Install Qt
QT_INSTALLER_URL="http://download.qt-project.org/archive/online_installers/4.0/qt-unified-linux-x64-4.0.0-online.run"
QT_INSTALLER_SHA256="f2b305da5e7da0f0b939a4a5d2495d4395cf76c9a82e6c42cb411b80b3fdd009"
#   Create install directory
mkdir -p /tmp/qt
cd /tmp/qt
#  Download installer script
echo "${QT_INSTALLER_SHA256} -" > sum.txt
curl -L "${QT_INSTALLER_URL}" | tee installer.run | sha256sum -c sum.txt
chmod +x installer.run
#  Creating Qt credentials ...
mkdir -p /root/.local/share/Qt
echo "[QtAccount]\nemail=${SECRET_QT_LOGIN}\njwt=${SECRET_QT_JWT}\nu=${SECRET_QT_U}\n" > /root/.local/share/Qt/qtaccount.ini
#  Install Qt packages
./installer.run --accept-obligations --accept-licenses --confirm-command --root "${QT_PATH}" --auto-answer telemetry-question=No install qt.qt5.$(echo "${QT_VERSION}" | tr -d .).${QT_BIN_PACKAGE}
#  Clean Qt installation
find "${QT_PATH}" -mindepth 1 -maxdepth 1 ! -name "${QT_VERSION}" ! -name "Tools" ! -name "Licenses" -exec echo 'Removing: {}' \; -exec rm -r '{}' \; && rm -rf "${QT_PATH}/Tools/QtCreator"
#  Cleaning install files
cd /
rm -rf /tmp/qt /root/.local/share/Qt /root/.config/Qt
