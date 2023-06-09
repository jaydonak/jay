#!/usr/bin/env bash
set -euxo pipefail

PROTO_VERSION="21.0"
PROTOC_ZIP="protoc-${PROTO_VERSION}-linux-x86_64.zip"
cd /tmp
sudo apt-get update
sudo apt-get install libtool curl make g++ unzip -y
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/${PROTOC_ZIP}
sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
sudo unzip -o $PROTOC_ZIP -d /usr/local 'include/*'
sudo chmod 755 /usr/local/bin/protoc
sudo chmod -R 755 /usr/local/include
# For debugging
protoc --version
python -m pip install --upgrade pip
python -m pip install protobuf==4.21.1
