#!/usr/bin/env bash

# Automatic installation script for latest nagios-core + plugins from git
#
#
#
#
# check if running as root
if [ $EUID -ne 0 ]; then
  echo "This script is not being run as root."
  echo "Please run it as root user by using either sudo or su command."
  exit 1
fi
VERSION=$(curl --silent -qI https://github.com/NagiosEnterprises/nagioscore/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')
echo $VERSION
# mkdir -p nagios
cd /tmp
curl -LO https://github.com/NagiosEnterprises/nagioscore/releases/download/$VERSION/$VERSION.tar.gz
