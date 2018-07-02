#!/bin/bash

/usr/sbin/sshd

/install/postCfg2.sh "2\n1\nn\nn\ncolumnstore-1\n1\n1\nserver-um\n${UM_NODE_IP}\n\n2\nserver-pm1\n${PM1_NODE_IP}\n\n\nserver-pm2\n${PM2_NODE_IP}\n\n2\n\n\n"