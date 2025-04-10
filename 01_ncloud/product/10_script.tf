resource "ncloud_init_script" "lch_init_ssh" {
    name = "ssh-key-script"
    content = ""
}

resource "ncloud_init_script" "lch_init_ssh_wordpress" {
    name = "ssh-key-wordpress-script"
    content = "#! /bin/bash\nwget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz\ntar xvfz wordpress-6.7.2-ko_KR.tar.gz \ncp -ar wordpress/* /var/www/html/\nsed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/g' /etc/httpd/conf/httpd.conf\ncp /var/www/html/{wp-config-sample.php,wp-config.php}\nsed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php\nsed -i 's/username_here/root1/g' /var/www/html/wp-config.php\nsed -i 's/password_here/It12345!/g' /var/www/html/wp-config.php\nsed -i 's/localhost/10.0.5.6/g' /var/www/html/wp-config.php\necho -n 'PGh0bWw+PGJvZHk+PGgxPmhlYWx0aC10ZXN0cGFnZTwvaDE+PC9ib2R5PjwvaHRtbD4=' | base64 -d > /var/www/html/health.html\nsystemctl enable --now httpd"
}