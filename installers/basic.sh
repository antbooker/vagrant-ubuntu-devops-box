#!/bin/bash

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

set -e

# Install Universe
add-apt-repository -y \
  universe

# Install Basic CLI Packages
apt-get update
apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  dbus \
  dnsutils \
  dpkg \
  fakeroot \
  file \
  ftp \
  gnupg \
  iproute2 \
  iputils-ping \
  jq \
  libcurl4 \
  libgconf-2-4 \
  libgtk-3-0 \
  libsecret-1-dev \
  libunwind8 \
  libxkbfile-dev \
  libxss1 \
  lsb-release \
  locales \
  netcat \
  openssh-client \
  pkg-config \
  rpm \
  rsync\
  shellcheck \
  software-properties-common \
  sudo \
  telnet \
  time \
  tzdata \
  unzip \
  wget \
  xorriso \
  xvfb \
  xz-utils \
  zip \
  zsync

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
for cmd in curl file ftp jq netcat ssh rsync shellcheck sudo telnet time unzip wget zip; do
    if ! command -v $cmd; then
        echo "$cmd was not installed"
        exit 1
    fi
done

# Document to README.md
DocumentInstalledItem "Basic CLI:"
DocumentInstalledItemIndent "apt-transport-https"
DocumentInstalledItemIndent "ca-certificates"
DocumentInstalledItemIndent "curl"
DocumentInstalledItemIndent "dbus"
DocumentInstalledItemIndent "dnsutils"
DocumentInstalledItemIndent "dpkg"
DocumentInstalledItemIndent "fakeroot"
DocumentInstalledItemIndent "file"
DocumentInstalledItemIndent "ftp"
DocumentInstalledItemIndent "gnupg"
DocumentInstalledItemIndent "iproute2"
DocumentInstalledItemIndent "iputils-ping"
DocumentInstalledItemIndent "jq"
DocumentInstalledItemIndent "libcurl4"
DocumentInstalledItemIndent "libgconf-2-4"
DocumentInstalledItemIndent "libgtk-3-0"
DocumentInstalledItemIndent "libsecret-1-dev"
DocumentInstalledItemIndent "libunwind8"
DocumentInstalledItemIndent "libxkbfile-dev"
DocumentInstalledItemIndent "libxss1"
DocumentInstalledItemIndent "lsb-release"
DocumentInstalledItemIndent "locales"
DocumentInstalledItemIndent "netcat"
DocumentInstalledItemIndent "openssh-client"
DocumentInstalledItemIndent "pkg-config"
DocumentInstalledItemIndent "rpm"
DocumentInstalledItemIndent "rsync"
DocumentInstalledItemIndent "shellcheck"
DocumentInstalledItemIndent "software-properties-common"
DocumentInstalledItemIndent "sudo"
DocumentInstalledItemIndent "telnet"
DocumentInstalledItemIndent "time"
DocumentInstalledItemIndent "tzdata"
DocumentInstalledItemIndent "unzip"
DocumentInstalledItemIndent "wget"
DocumentInstalledItemIndent "xorriso"
DocumentInstalledItemIndent "xvfb"
DocumentInstalledItemIndent "xz-utils"
DocumentInstalledItemIndent "zip"
DocumentInstalledItemIndent "zsync"
