#!/bin/bash

PKG_MANAGER=$( command -v yum || command -v apt-get ) || echo "Neither yum nor apt-get found"

# make sure wget is installed for downloading kubernetes and config files
if [ ! -e "/usr/bin/wget" ]; then
  sudo ${PKG_MANAGER} install -y wget
fi

# make sure openssl is installed
if [ ! -e "/usr/bin/openssl" ]; then
  sudo ${PKG_MANAGER} install -y openssl
fi

# make sure jq is installed for processing json on the command-line
if [ ! -e "/usr/bin/jq" ]; then
  sudo ${PKG_MANAGER} install -y jq
fi

# make sure envsubst is installed for substituting values of environment variables
if [ ! -e "/usr/bin/envsubst" ]; then
  sudo ${PKG_MANAGER} install -y gettext
fi

# make the temp directory
if [ ! -e ~/.kube ]; then
  mkdir -p ~/.kube;
fi

# if kubernetes is not installed, download the latest stable version
if [ ! -e ~/.kube/kubectl ]; then
  wget https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -O ~/.kube/kubectl
  chmod +x ~/.kube/kubectl
fi

