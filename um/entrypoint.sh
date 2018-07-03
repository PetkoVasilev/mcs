#!/bin/bash

/usr/sbin/sshd

/install/postCfg2.sh "2\n1\nn\nn\ncolumnstore-1\n1\n1\nserver-um\n${MARIADB_CS_UM_SERVICE_HOST}\n1\n\n2\nserver-pm1\n${MARIADB_CS_PM1_SERVICE_HOST}\n1\n\n\nserver-pm2\n${MARIADB_CS_PM2_SERVICE_HOST}\n1\n\n2\n\n\n"