FROM mariadb/columnstore_base:latest

RUN wget "https://downloads.mariadb.com/ColumnStore/latest/centos/x86_64/7/mariadb-columnstore-1.1.5-1-centos7.x86_64.rpm.tar.gz" -O /root/mcs.tar.gz
RUN tar xvzf /root/mcs.tar.gz -C /root
RUN rm /root/mcs.tar.gz

COPY entrypoint.sh entrypoint.sh
COPY postCfg2.sh /install/
RUN chmod +x entrypoint.sh
RUN chmod +x /install/postCfg2.sh

RUN yum install -y openssh-clients openssh-server

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
RUN mkdir -p /root/.ssh
RUN cp /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa
RUN cp /etc/ssh/ssh_host_rsa_key.pub /root/.ssh/id_rsa.pub
RUN cp /etc/ssh/ssh_host_rsa_key.pub /root/.ssh/authorized_keys

VOLUME /usr/local/mariadb/columnstore/etc
VOLUME /usr/local/mariadb/columnstore/data1
VOLUME /usr/local/mariadb/columnstore/local
VOLUME /usr/local/mariadb/columnstore/mysql/db

EXPOSE 3306
EXPOSE 22

