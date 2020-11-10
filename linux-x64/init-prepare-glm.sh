#!/usr/bin/sh

set -e
set -x

# Install GLM
GLM_SOURCE_URL="https://github.com/g-truc/glm/archive/0.9.9.8.tar.gz"
GLM_SOURCE_SHA256="7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592"
#   Create install directory
mkdir -p /tmp/glm
cd /tmp/glm
#  Download and extract source release
echo "${GLM_SOURCE_SHA256} -" > sum.txt
curl -L "${GLM_SOURCE_URL}" | tee glm-source.tar.gz | sha256sum -c sum.txt
tar xf glm-source.tar.gz
#  Install
cp -r glm-0.9.9.8/glm /usr/local/include
#  Cleaning install files
cd /
rm -rf /tmp/glm
