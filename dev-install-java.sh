#!/usr/bin/env bash

set -euxo pipefail

# install: java stuff
sudo -E apt install -y openjdk-8-jdk openjdk-8-source ant ant-optional ant-contrib maven maven-ant-helper

sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Make Java 8 the default
sudo -E update-alternatives --set java /usr/lib/jvm/java-8-*/jre/bin/java