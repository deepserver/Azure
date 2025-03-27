#!/bin/bash
mkdir /home/smlee/.ssh
echo -e "${var.id_rsa}" > /home/smlee/.ssh/id_rsa
chmod 600 /home/smlee/.ssh/id_rsa
chown smlee.smlee /home/smlee/.ssh/id_rsa