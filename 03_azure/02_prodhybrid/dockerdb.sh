#!/bin/bash
setenforce 0
grubby --update-kernel ALL --args selinux=0
systemctl restart chronyd
sleep 10

dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io
systemctl enable --now docker

docker pull mysql:8.0

mkdir /master
mkdir /slave
echo -e "[mysqld]\n\
log-bin=mysql-bin\n\
server-id=1" >> /master/master.conf
echo -e "[mysqld]\n\
log-bin=mysql-bin\n\
server-id=2" >> /slave/slave.conf

docker run -d --name mysql-m -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=It12345! \
-e MYSQL_DATABASE=wordpress \
-v /master/master.conf:/etc/mysql/conf.d/master.conf \
-d mysql:8.0

docker run -d --name mysql-s -p 63306:3306 \
-e MYSQL_ROOT_PASSWORD=It12345! \
-e MYSQL_DATABASE=wordpress \
-v /slave/slave.conf:/etc/mysql/conf.d/slave.conf \
-d mysql:8.0

sleep 20

set +H

docker exec -it mysql-m mysql -uroot -pIt12345! \
-e "CREATE USER 'team3'@'10.0.%' IDENTIFIED BY 'It12345!'; GRANT ALL PRIVILEGES ON wordpress.* TO 'team3'@'10.0.%'; FLUSH PRIVILEGES;"
docker exec -it mysql-m mysql -uroot -pIt12345! \
-e "alter user 'team3'@'10.0.%' identified with mysql_native_password by 'It12345!'; FLUSH PRIVILEGES;"
docker exec -it mysql-m bash -c \
"echo -e '[mysqld]\nbind-address = 0.0.0.0\n[client]\nuser=root\npassword=It12345\!' > /etc/mysql/conf.d/rootaccess.cnf"
docker exec -it mysql-m mysql -uroot -pIt12345! \
-e "USE wordpress; CREATE TABLE wdtb(no int(10) not null, name varchar(100) not null); DESC wdtb;"

docker exec -it mysql-m bash -c "mysqldump -uroot -pIt12345! wordpress > word.sql"
docker cp mysql-m:word.sql .
docker cp word.sql mysql-s:.
docker exec -it mysql-s bash -c "mysql -uroot -pIt12345! wordpress < word.sql"

MASTER_CONTAINER="mysql-m"
SLAVE_CONTAINER="mysql-s"

MYSQL_USER="root"
MYSQL_PASSWORD="It12345!"

REPL_USER="team3"
REPL_PASSWORD="It12345!"

read BINLOG_FILE BINLOG_POS <<< $(docker exec -i $MASTER_CONTAINER \
  mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -N -e "SHOW MASTER STATUS;" | awk '{print $1, $2}')

echo "Master binlog file: $BINLOG_FILE"
echo "Master binlog position: $BINLOG_POS"

docker exec -i $SLAVE_CONTAINER \
  mysql -u$MYSQL_USER -p$MYSQL_PASSWORD \
  -e "CHANGE MASTER TO \
MASTER_HOST='10.10.5.11', \
MASTER_USER='$REPL_USER', \
MASTER_PASSWORD='$REPL_PASSWORD', \
MASTER_LOG_FILE='$BINLOG_FILE', \
MASTER_LOG_POS=$BINLOG_POS;"

docker exec -i $SLAVE_CONTAINER \
  mysql -u$MYSQL_USER -p$MYSQL_PASSWORD \
  -e "START SLAVE; SHOW SLAVE STATUS\G"

docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=58080:8080 --detach=true --name=cad gcr.io/cadvisor/cadvisor
