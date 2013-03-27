#!/usr/bin/env bash

########################################################################################################################
#                                    Install JBoss AS                                                                  #
#                                                                                                                      #
# - http://jdbc.postgresql.org/download.html                                                                           #
# - http://jan.zawodny.pl/blog/2011/07/jboss-7-postgresql-9                                                            #
# - https://docs.jboss.org/author/display/AS71/add-user+utility                                                        #
# - https://docs.jboss.org/author/display/AS7/Deploying+the+Helloworld+example+using+Eclipse                           #
# - http://stackoverflow.com/questions/14012549/how-to-install-postgresql-v9-1-and-jboss-as-v7-1-1-on-ubuntu-12-04-lts #
########################################################################################################################

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
		
		# adding a management JBoss AS user - Currently this has a bug on JBoss's end
		# a postInstall.sh will be created and will need to be executed from the CLI
		# sudo $JBOSS_BIN/add-user.sh --silent jboss jb055mu
		# sudo $JBOSS_BIN/add-user.sh --silent -a jbossau jb055au
		sudo echo "./bin/add-user.sh --silent jboss jb055mu" > $JBOSS_DIR/postInstall.sh
		sudo echo "./bin/add-user.sh --silent -a jbossau jb055au" >> $JBOSS_DIR/postInstall.sh
		sudo echo "./bin/standalone.sh" >> $JBOSS_DIR/postInstall.sh
		sudo echo "./bin/standalone.sh" >> $JBOSS_BIN/run.sh
		sudo chmod 744 $JBOSS_DIR/postInstall.sh
		
		# configuring the connection between JBoss and Postgres
		sudo mkdir -p $JBOSS_POSTGRES
		sudo cp $LIB/$POSTGRES_JDBC4 $JBOSS_POSTGRES
		sudo cp $DATA/module.xml $JBOSS_POSTGRES
		sudo cp -p ${JOSS_CONFIG}/standalone.xml ${JBOSS_STANDALONE_BACKUP}/standalone_default.xml
		sudo cp -f ${DATA}/standalone.xml ${JBOSS_STANDALONE_CONFIG}
		
		# correcting the permissions
		sudo chown -R vagrant $JBOSS_DIR
		sudo chgrp -R vagrant $JBOSS_DIR
	fi
	
	echo "Installing JBoss AS... Finish."
fi
