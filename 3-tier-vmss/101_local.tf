# USER DATA File for Bastion VM
locals {
  id_rsa = <<USER_DATA
#!/bin/bash
mkdir /home/${var.name}/.ssh
echo -e "${var.id_rsa}" > /home/${var.name}/.ssh/id_rsa
chmod 600 /home/${var.name}/.ssh/id_rsa
chown ${var.name}.${var.name} /home/${var.name}/.ssh/id_rsa
USER_DATA
}

# USER DATA File for Web Service VM
locals {
  wd = <<USER_DATA
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
sed -i "s/username_here/${var.name}/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345!/g" /var/www/html/wp-config.php
sed -i "s/localhost/10.0.5.4/g" /var/www/html/wp-config.php
cat > /var/www/html/health.html << eof
<html><body><h1>health-testpage</h1></body></html>
eof
chown -R apache.apache /var/www
systemctl enable --now httpd
USER_DATA
}

# USER DATA File for Web Service VM
locals {
  wdimage = <<USER_DATA
#!/bin/bash
setenforce 0
grubby --update-kernel ALL --args selinux=0
yum install -y WALinuxAgent httpd wget tar php php-cli php-pdo php-fpm php-json php-mysqlnd 
wget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz
tar xvfz wordpress-6.7.2-ko_KR.tar.gz
cp -ar wordpress/* /var/www/html/
sed -i "s/DirectoryIndex index.html/DirectoryIndex index.php/g" /etc/httpd/conf/httpd.conf
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sed -i "s/username_here/${var.name}/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345!/g" /var/www/html/wp-config.php
sed -i "s/localhost/10.0.5.4/g" /var/www/html/wp-config.php
cat > /var/www/html/health.html << eof
<html><body><h1>health-testpage</h1></body></html>
eof
chown -R apache.apache /var/www
systemctl enable --now httpd
waagent -deprovision -force
USER_DATA
}
