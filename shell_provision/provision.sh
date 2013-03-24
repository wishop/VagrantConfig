#!/usr/bin/env bash

DIR="/opt/vagrant/shell_provision"

# setting up the permissions on the shared folder
sudo chown -R vagrant /opt
sudo chgrp -R vagrant /opt

# OS Essential builds and updates
$DIR/build_essentials.sh $DIR

# Java Oracle build
$DIR/build_java.sh $DIR

# Eclipse & Git build
$DIR/build_eclipse.sh $DIR

# Maven build
$DIR/build_maven.sh $DIR

# postgreSQL build
$DIR/build_postgresql.sh $DIR

# keep things pristine
sudo apt-get -y autoremove
sudo apt-get clean
