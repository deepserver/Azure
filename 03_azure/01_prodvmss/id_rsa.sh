#!/bin/bash
mkdir /home/team3/.ssh
echo -e "${var.id_rsa}" > /home/team3/.ssh/id_rsa
chmod 600 /home/team3/.ssh/id_rsa
chown team3.team3 /home/tema3/.ssh/id_rsa