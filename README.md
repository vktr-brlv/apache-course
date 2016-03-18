# apache-course

Web servers course

## General Setup

__Shell Commands__

```
# yum install httpd nginx mysql-server php php-mysql php-gd -y --nogpgcheck
# rpm -ivh http://download.ispsystem.com/repo/centos/release/6/x86_64/mod_rpaf-0.8.2-1.el6.x86_64.rpm

# chkconfig httpd on

# service mysqld start
# /usr/bin/mysql_secure_installation
# service httpd start
# mysql -u root -p
```

__DB Commands__
```
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost;
SET PASSWORD FOR wordpressuser@localhost= PASSWORD("password");
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
```

```
# cp -r /vagrant/wordpress /var/www/html/
# cd /var/www/html
# cp wordpress/wp-config-sample.php wordpress/wp-config.php
# vim /etc/httpd/conf/httpd.conf
# vim wordpress/wp-config.php
```
