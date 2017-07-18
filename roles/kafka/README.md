# To check kafka is running

netstat -natlp | grep 2181

You should see something like:
$ sudo netstat -natlp | grep 2181
tcp6       0      0 :::2181                 :::*                    LISTEN      11144/java
tcp6       0      0 127.0.0.1:39894         127.0.0.1:2181          ESTABLISHED 13079/java
tcp6       0      0 127.0.0.1:2181          127.0.0.1:39894         ESTABLISHED 11144/java

# when you start kafka server with the following command
bin/kafka-server-start.sh config/server.properties

You should see something like this on the last line:
INFO [Kafka Server 0], started (kafka.server.KafkaServer)






- name: Create dir path for app
  file:
    path: /opt/kafka
    state: directory
    mode: 0755

- name: Install java
  yum: name=java-1.8.0-openjdk.x86_64 state=present update_cache=yes

- name:
  lineinfile:
    dest: /etc/profile
    line: "{{ item }}"
  with_items:
    - 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk'
    - 'export JRE_HOME=/usr/lib/jvm/jre'

- name: Reload the profile to put your changes into effect
  shell: source /etc/profile

- name: Download kafka
  get_url:
    url: http://www-us.apache.org/dist/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
    dest: /opt/kafka

- name: Unarchive kafka_2.11-0.9.0.1.tgz
  unarchive:
    src: /opt/kafka/kafka_2.11-0.9.0.1.tgz
    dest: /opt/kafka/
    remote_src: true

- name:  Start the Zookeeper server
  command: chdir=/opt/kafka/kafka_2.11-0.9.0.1/bin ./zookeeper-server-start.sh -daemon config/zookeeper.properties

- name: Modify the configuration of your Kafka server
  lineinfile:
    dest: /opt/kafka/kafka_2.11-0.9.0.1/bin/kafka-server-start.sh
    regexp: 'export KAFKA_HEAP_OPTS="-Xmx1G -Xms1G"'
    line: 'export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"'
