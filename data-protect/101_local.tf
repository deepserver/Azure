# USER DATA File for Bastion VM
locals {
  id_rsa = <<USER_DATA
#!/bin/bash
setenforce 0
grubby --update-kernel ALL --args selinux=0
mkdir /home/${var.name}/.ssh
echo -e "${var.id_rsa}" > /home/${var.name}/.ssh/id_rsa
chmod 600 /home/${var.name}/.ssh/id_rsa
chown ${var.name}.${var.name} /home/${var.name}/.ssh/id_rsa
dnf install -y ansible
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
sed -i "s/localhost/10.0.4.4/g" /var/www/html/wp-config.php
cat > /var/www/html/health.html << eof
<html><body><h1>health-testpage</h1></body></html>
eof
chown -R apache.apache /var/www
systemctl enable --now httpd
USER_DATA
}

# USER DATA File for Web Image VM
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

locals {
  ftp = <<USER_DATA
#!/bin/bash
setenforce 0
grubby --update-kernel ALL --args selinux=0
dnf install -y vsftpd
dnf install -y ftp
sudo useradd -m smlee
sudo useradd -m kjs
sudo useradd -m lhb
sudo useradd -m lch
echo "team3:team3" | sudo chpasswd
echo "smlee:team3" | sudo chpasswd
echo "kjs:team3" | sudo chpasswd
echo "lhb:team3" | sudo chpasswd
echo "lch:team3" | sudo chpasswd
cat <<EOF > /etc/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
#anon_upload_enable=YES
#anon_mkdir_write_enable=YES
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=NO
#chown_uploads=YES
#chown_username=whoever
xferlog_file=/ftp/xferlog
xferlog_std_format=YES
idle_session_timeout=120
data_connection_timeout=30
#nopriv_user=ftpsecure
#async_abor_enable=YES
#ascii_upload_enable=YES
#ascii_download_enable=YES
banner_file=/ftp/ban
#deny_email_enable=YES
#banned_email_file=/etc/vsftpd/banned_emails
#chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/ftp/chroot
#ls_recurse_enable=YES
listen=NO
listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=65000
pasv_max_port=65100
log_ftp_protocol=YES
syslog_enable=YES
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/ftp/chroot
EOF
mv /etc/vsftpd.conf /etc/vsftpd/vsftpd.conf
mkdir -p /ftp
chown smlee:smlee /ftp
chmod 755 /ftp
echo "smlee" > /ftp/chroot
echo "------ Team3 FTP Server ------" > /ftp/ban
mkdir -p /ftp/shared
chown smlee:team3 /ftp/shared
chmod 775 /ftp/shared
mkdir -p /home/kjs/ftp
mkdir -p /home/lhb/ftp
mkdir -p /home/lch/ftp
chown kjs:kjs /home/kjs/ftp
chown lhb:lhb /home/lhb/ftp
chown lch:lch /home/lch/ftp
chmod 755 /home/*/ftp
systemctl restart vsftpd
USER_DATA
}
