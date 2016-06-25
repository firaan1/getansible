#!/bin/bash
zypper > /dev/null
if [ $? -ne 0 ]; then
	echo -e "\nzypper not found...\n"; exit 1
fi

zypper update
zypper -n install git ssh python-setuptools sshpass