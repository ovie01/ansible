#!/bin/bash
yum install curl openssh-server
echo $?

systemctl enable sshd
echo $?

systemctl start sshd
echo $?

yum install postfix
echo $?

systemctl enable postfix
echo $?

systemctl start postfix
echo $?

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
echo $?

yum install gitlab-ce -y
echo $?

gitlab-ctl reconfigure
echo $?
