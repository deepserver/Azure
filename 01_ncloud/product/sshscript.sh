#! /bin/bash

mkdir .ssh
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1icIef2V0+x2dFQMGD9inuAPwgGGa3raQRfWa3gP+eSgGQ/WEM317H7HI5sYoNVhjiAKEd4cSzZK5cv1LgDIUBE+yLVuuQP1G/JKFw5oBNgxSNyOvlapP52v0UyFU5Joid88O5KsoMlAuIxq0A588JcjeMH0Qxv8hlYhBzHt/oNCEXS1ofPa7zm4JF8dQcpX9O/2/MHNk7X5L7Y1na/vvlgiT05ckAx3oAVRICgEJkqvFiOq34EQF3rrS2AMKH69pSHA74xl9mQWOOoTJW/M7PLYQ5lGfIH88m53CUs5SejLPY7Xirr1Ya3Bd8B+2cssymWveBXgKsHZlASntCx5P" >> .ssh/authorized_keys

echo -e "-----BEGIN RSA PRIVATE KEY-----

-----END RSA PRIVATE KEY-----" >> .ssh/id_rsa

chmod 600 .ssh/id_rsa