#!/usr/bin/env bash

##################################################
#             Install Oracle Java v7             #
# http://www.duinsoft.nl/packages.php?t=en#repo  #
##################################################

DIR=$1
. $DIR/conf/provision.conf
. $CONF/java.conf

if [ ! -d $JAVA_DIR ]; then
	echo "Installing Java..."

	#remove existing versions
	sudo apt-get purge -y openjdk-\*
	
	sudo cat $DATA/java >> /etc/apt/sources.list
	sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26

	sudo apt-get update
	sudo apt-get install -y update-sun-jre

	echo "Installing Java... Finish."
fi
