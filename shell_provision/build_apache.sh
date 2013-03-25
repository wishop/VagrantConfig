#!/usr/bin/env bash

#########################################
#            Install Apache2            #
#########################################

DIR=$1
. ${DIR}/conf/apache.conf

if [ ! -d $APACHE_DIR ]; then
	echo "Installing Apache 2..."

	sudo apt-get install -y apache2

	echo "Installing Apache 2... Finish."
	
fi



