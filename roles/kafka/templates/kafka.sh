#!/bin/bash
sudo yum update -y
echo $?

sudo yum install java-1.8.0-openjdk.x86_64 -y
echo $?

cat > /etc/profile << EOM
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk
export JRE_HOME=/usr/lib/jvm/jre
EOM
echo $?


cat > /etc/yum.repos.d/sensu.repo << EOM
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk
export JRE_HOME=/usr/lib/jvm/jre
EOM
echo $?

source /etc/profile
echo $?

cd ~
wget http://www-us.apache.org/dist/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
echo $?

tar -xvf kafka_2.11-0.9.0.1.tgz
echo $?

sudo mv kafka_2.11-0.9.0.1 /opt
echo $?

cd /opt/kafka_2.11-0.9.0.1
echo $?

bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
echo $?

sed -i -e 's/export KAFKA_HEAP_OPTS="-Xmx1G -Xms1G"/export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"/' /opt/kafka_2.11-0.9.0.1/bin/kafka-server-start.sh
echo $?

bin/kafka-server-start.sh config/server.properties
echo $?
