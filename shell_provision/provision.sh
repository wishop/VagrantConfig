#!/usr/bin/env bash

DIR="/opt/vagrant/shell_provision"

#setting up the permissions on the shared folder
sudo chown -R vagrant /opt
sudo chgrp -R vagrant /opt

# OS Essential builds and updates
$DIR/build_essentials.sh $DIR

# Eclipse build
$DIR/build_eclipse.sh $DIR

#keep things pristine
sudo apt-get -y autoremove
sudo apt-get clean
