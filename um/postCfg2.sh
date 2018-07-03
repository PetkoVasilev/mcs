#!/bin/sh
export USER=root
# for kubernetes dns
export PM1_NODE_IP="$(host mariadb-cs-pm1 | awk '/has address/ { print $4 ; exit }')"
export PM2_NODE_IP="$(host mariadb-cs-pm2 | awk '/has address/ { print $4 ; exit }')"
export UM_NODE_IP="$(host mariadb-cs-um | awk '/has address/ { print $4 ; exit }')"

# postConfigure with input passed in
/bin/echo -e "$1" | /usr/local/mariadb/columnstore/bin/postConfigure

# update root user to allow external connection, need to turn off NO_AUTO_CREATE_USER. 
ssh -vvv -l root ${UM_NODE_IP} '/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-file=/usr/local/mariadb/columnstore/mysql/my.cnf -uroot -vvv -Bse "set sql_mode=NO_ENGINE_SUBSTITUTION;GRANT ALL ON *.* to root@'"'"'%'"'"';FLUSH PRIVILEGES;"'

tail -f /dev/null
