#Check that MongoDB is running by checking that the port '27017' is open.
netstat -plntu

#Check log
tail /var/log/mongodb/mongod.log

#Check Status
systemctl status mongod
