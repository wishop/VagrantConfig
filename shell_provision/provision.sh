#!/usr/bin/env bash

IS_UPDATE=$1
DIR="/opt/vagrant/shell_provision"

# setting up the permissions on the shared folder
sudo chown -R vagrant /opt
sudo chgrp -R vagrant /opt

# OS Essential builds and updates
$DIR/build_essentials.sh $DIR $IS_UPDATE

# Java Oracle build
$DIR/build_java.sh $DIR $IS_UPDATE

# Eclipse, Maven, MyLyn & Git build
$DIR/build_eclipse.sh $DIR $IS_UPDATE

# postgreSQL & postgreSQL Admin 3 build
$DIR/build_postgresql.sh $DIR $IS_UPDATE

# JBoss AS build
$DIR/build_jboss.sh $DIR $IS_UPDATE

# Apache2 build
$DIR/build_apache.sh $DIR $IS_UPDATE

# keep things pristine
sudo apt-get -y autoremove
sudo apt-get clean
