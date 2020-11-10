#!/usr/bin/sh

set -e
set -x

# Install HDF5
HDF5_SOURCE_URL="https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.0/src/hdf5-1.12.0.tar.gz"
HDF5_SOURCE_SHA256="a62dcb276658cb78e6795dd29bf926ed7a9bc4edf6e77025cd2c689a8f97c17a"
#   Create install directory
mkdir -p /tmp/hdf5
cd /tmp/hdf5
#  Download and extract source release
echo "${HDF5_SOURCE_SHA256} -" > sum.txt
curl -L "${HDF5_SOURCE_URL}" | tee hdf5-source.tar.gz | sha256sum -c sum.txt
tar xf hdf5-source.tar.gz
#  Build and install
mkdir hdf5-build
cd hdf5-build
../hdf5-1.12.0/configure \
    --prefix=/usr/local \
    --enable-cxx
make -j $(($(nproc) + 1))
make check
make install
#  Cleaning install files
cd /
rm -rf /tmp/hdf5
