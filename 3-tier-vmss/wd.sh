#!/bin/bash
setenforce 0
grubby --update-kernel ALL --args selinux=0
yum install -y httpd wget tar php php-cli php-pdo php-fpm php-json php-mysqlnd 
wget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz
tar xvfz wordpress-6.7.2-ko_KR.tar.gz
cp -ar wordpress/* /var/www/html/
sed -i "s/DirectoryIndex index.html/DirectoryIndex index.php/g" /etc/httpd/conf/httpd.conf
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sed -i "s/username_here/smlee/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345\!/g" /var/www/html/wp-config.php
sed -i "s/localhost/10.0.6.4/g" /var/www/html/wp-config.php
cat > /var/www/html/health.html << eof
<html><body><h1>health-testpage</h1></body></html>
eof
chown -R apache.apache /var/www
systemctl enable --now httpd