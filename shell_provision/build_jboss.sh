#!/usr/bin/env bash

##############################################################################################
#                                    Install JBoss AS                                        #
#                                                                                            #
# - https://docs.jboss.org/author/display/AS71/add-user+utility                              #
# - https://docs.jboss.org/author/display/AS7/Deploying+the+Helloworld+example+using+Eclipse #                                                             #
##############################################################################################

DIR=$1
. $DIR/conf/jboss.conf

if [ ! -d $JBOSS_DIR ]; then
	echo "Installing JBoss AS..."

	# check if we already downloaded the JBoss AS archive
	if [ ! -f $JBOSS_FILE ]; then
		wget -c -O$JBOSS_FILE "$JBOSS_URL"
	fi
	
	if [ -f $JBOSS_FILE ]; then
	
		sudo mkdir $JBOSS_DIR
		sudo tar -zxvf $JBOSS_FILE -C $JBOSS_DIR --strip-components=1
		sudo chown -R vagrant $JBOSS_DIR
		sudo chgrp -R vagrant $JBOSS_DIR
		
		# adding a management JBoss AS user
		sudo $JBOSS_BIN/add-user.sh --silent jboss jb055mu > ${DOWNLOADS}/capture.log 2>&1
		
		# adding an application JBoss AS user
		sudo $JBOSS_BIN/add-user.sh --silent -a jbossau jb055@u > ${DOWNLOADS}/capture.log 2>&1
	fi
	
	echo "Installing JBoss AS... Finish."
fi
