#!/bin/bash
docker build -t gpg4usb-linux-32bit -f dockerfile_devenv_gpg4usb_linux_32bit .
docker build -t gpg4usb-linux-64bit -f dockerfile_devenv_gpg4usb_linux_64bit .

# Copy new build to /tmp/gpg4usb/gpg4usb_daily.zip on host
mkdir -p /tmp/gpg4usb
docker run -v /tmp/gpg4usb:/out gpg4usb-linux-64bit:latest /bin/cp /opt/gpg4usb_daily.zip /out
