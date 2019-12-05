#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Install Universe
add-apt-repository universe -y

# Use apt-fast for parallel downloads
apt-get install --no-install-recommends aria2 -y
add-apt-repository ppa:apt-fast/stable -y
apt-get update -y
apt-get install apt-fast -y
echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
echo debconf apt-fast/dlflag boolean true | debconf-set-selections
echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
