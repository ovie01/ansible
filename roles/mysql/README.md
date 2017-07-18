#- name: Install mysql repo
#  yum:
#    name: 'https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
#    state: present
- name: Creat /opt/mysql directory
  file:
    dest: /opt/mysql
    state: directory
    mode: 0755

- name: install mysql repo
  yum:
    name: 'https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
    state: present

- name: install mysql
  yum: name=mysql-server state=present update_cache=yes

- name: ensure mysqld started
  service: name=mysqld state=started enabled=yes












  - name: install mysql repo
    yum:
      name: 'https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
      state: present


  - name: install mysql and related packages
    yum: pkg={{ item }}
         state=present
    with_items:
      - mysql
      - mysql-server
      - MySQL-python
      - php-mysql
      - php-pear

  - name: ensure mysqld started
    service: name=mysqld state=started enabled=yes
