#!/bin/bash

# for kubernetes dns
export PM1_NODE_IP="$(ifconfig eth0 | awk '$1 == "inet" {print $2}')"
export PM2_NODE_IP="$(host mariadb-cs-pm2 | awk '/has address/ { print $4 ; exit }')"
export UM_NODE_IP="$(host mariadb-cs-um | awk '/has address/ { print $4 ; exit }')"

/usr/sbin/sshd

/install/postCfg2.sh "2\n1\nn\nn\ncolumnstore-1\n1\n1\nserver-um\n${UM_NODE_IP}\n\n2\nserver-pm1\n${PM1_NODE_IP}\n\n\nserver-pm2\n${PM2_NODE_IP}\n\n2\n\n\n"
