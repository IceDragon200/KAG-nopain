#!/bin/bash
echo "Hope you don't mind I update your system."
apt-get update -y -qq

# development dependencies
echo "Installing development deps."
apt-get install -qq \
  make \
  xz-utils \
  curl \
  gcc-multilib \
  g++-multilib \
  lib32z1-dev

echo "Installing some runtime deps."
apt-get install -qq \
  xorg \
  libx11-xcb1 \
  libfreetype6 \
  libglib2.0-0
