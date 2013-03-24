#!/usr/bin/env bash

#########################################
#             Install Maven             #
#########################################

DIR=$1
. ${DIR}/conf/maven.conf

if [ ! -d $MAVEN_DIR ]; then
	echo "Installing Maven..."
	
	sudo apt-get install -y maven
	
	echo "Installing Maven... Finish."
fi
