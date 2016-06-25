#!/bin/bash
apt-get > /dev/null
if [ $? -ne 0 ]; then
	echo -e "\napt-get not found...\n"; exit 1
fi

apt-get update
apt-get install -y git ssh python-setuptools sshpass