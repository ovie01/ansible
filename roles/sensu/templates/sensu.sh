#!/bin/bash

# Install EPEL-6 yum repo
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
echo $?

# Install Erlang
yum -y install erlang
echo $?

# Install RabbitMQ from RPM
rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
echo $?

rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/v2.7.1/rabbitmq-server-2.7.1-1.noarch.rpm
echo $?

# Install RabbitMQ management console
rabbitmq-plugins enable rabbitmq_management
echo $?

# Start and verify RabbitMQ
chkconfig rabbitmq-server on
echo $?

/etc/init.d/rabbitmq-server start
echo $?

# Create RabbitMQ vhost and user for Sensu
rabbitmqctl add_vhost /sensu
echo $?

rabbitmqctl add_user sensu sensu
echo $?

rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"
echo $?

# Install Redis
yum -y install redis
echo $?

chkconfig redis on
echo $?

/etc/init.d/redis start
echo $?

# Register Sensu-package repo
cat > /etc/yum.repos.d/sensu.repo << EOM
[sensu]
name=sensu-main
baseurl=http://repos.sensuapp.org/yum/el/6/x86_64/
gpgcheck=0
enabled=1
EOM
echo $?

# Install Sensu "Omnibus" Package
yum -y install sensu
echo $?

cd /etc/sensu; mv config.json.example config.json
echo $?

service sensu-api start ; service sensu-client start
echo $?

yum install -y uchiwa ; service uchiwa start ; chkconfig uchiwa on
echo $?

# Enable Sensu services
chkconfig sensu-server on
echo $?

chkconfig sensu-api on
echo $?

chkconfig sensu-client on
echo $?

# Start Sensu services
/etc/init.d/sensu-server start
echo $?

/etc/init.d/sensu-api start
echo $?

/etc/init.d/sensu-client start
echo $?

sudo yum install redis -y
echo $?

sudo systemctl start redis
echo $?

echo "[sensu]
name=sensu-main
baseurl=http://repos.sensuapp.org/yum/el/7/x86_64/
gpgcheck=0
enabled=1" | sudo tee /etc/yum.repos.d/sensu.repo
echo $?

sudo yum install sensu uchiwa -y
echo $?

sudo systemctl restart sensu-server
echo $?

sudo systemctl restart sensu-client
echo $?

sudo systemctl restart sensu-api
echo $?

sudo systemctl start uchiwa
echo $?

sudo systemctl enable sensu-server
echo $?

sudo systemctl enable sensu-client
echo $?

sudo systemctl enable sensu-api
echo $?

sudo systemctl enable uchiwa
echo $?
