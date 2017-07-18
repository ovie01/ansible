To check mariadb do:

systemctl enable mariadb
sudo mysql_secure_installation





- name: Create /opt/mariadb
  file:
    dest: /opt/mariadb
    state: directory
    mode: 0755

- name: install mysql packages
  yum: name="{{item}}" state=latest update_cache=yes
  with_items:
  - mariadb-server
  - MySQL-python

- name: ensure mysqld started
  service: name=mariadb state=started enabled=yes

- name: Create a new database with name 'bobdata'
  mysql_db:
    name: captain
    state: present
