Web Address
http://server_IP_address

Log paths
/var/log/gitlab/gitlab-rails  >> You have logs like application and production logs.  

/var/log/gitlab/gitlab-rails/application.log
It helps you discover events happening in your instance such as user creation, project removing and so on

/var/log/gitlab/gitlab-rails/production.log
It contains information about all performed requests. You can see the URL and type of request, IP address and what exactly parts of code were involved to service this particular request. Also you can see all SQL request that have been performed and how much time it took

/var/log/gitlab/gitlab-rails/githost.log
GitLab has to interact with Git repositories but in some rare cases something can go wrong and in this case you will know what exactly happened

/var/log/gitlab/gitlab-rails/sidekiq.log
GitLab uses background jobs for processing tasks which can take a long time. All information about processing these jobs are written down to this file
