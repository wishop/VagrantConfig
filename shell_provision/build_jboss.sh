#!/usr/bin/env bash

##################################################
#                Install JBoss AS                #
##################################################

DIR=$1
. $CONF/jboss.conf

if [ ! -d $JBOSS_DIR ]; then
	echo "Installing JBoss AS..."

	# check if we already downloaded the JBoss AS archive
	if [ ! -f $JBOSS_FILE ]; then
		wget -c -O$JBOSS_FILE "$JBOSS_URL"
	fi
	
	if [ -f $JBOSS_FILE ]; then
		tar -xvf $JBOSS_FILE -C /opt
	fi
	
	echo "Installing JBoss AS... Finish."
fi
