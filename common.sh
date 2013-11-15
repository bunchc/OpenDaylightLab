#!/bin/bash

# common.sh

# Authors: Kevin Jackson (kevin@linuxservices.co.uk)
#          Cody Bunch (bunchc@gmail.com)

# Vagrant scripts used by the OpenStack Cloud Computing Cookbook, 2nd Edition, October 2013
# Website: http://www.openstackcookbook.com/
# Suitable for OpenStack Grizzly

#
# Sets up common bits used in each build script.
#

export DEBIAN_FRONTEND=noninteractive

# Setup Proxy
export APT_PROXY="172.16.0.110"
export APT_PROXY_PORT=3142

#
# If you have a proxy outside of your VirtualBox environment, use it
if [[ ! -z "$APT_PROXY" ]]
then
	echo 'Acquire::http { Proxy "http://'${APT_PROXY}:${APT_PROXY_PORT}'"; };' | sudo tee /etc/apt/apt.conf.d/01apt-cacher-ng-proxy
fi

echo grub-pc hold | sudo dpkg --set-selections

#sudo apt-get update && sudo apt-get upgrade -y
