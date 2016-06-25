#!/bin/bash

git > /dev/null
if [ $? -ne 0 ]; then
	echo -e "\ngit not found...\n"; exit 1
fi

cd ${LOCAL_DIR}
if [ ! -d "ansible" ]; then
	git clone https://github.com/ansible/ansible.git
fi
if [ ! -d "ansible-modules-core" ]; then
	git clone https://github.com/ansible/ansible-modules-core.git
fi
if [ ! -d "ansible-modules.extras" ]; then
	git clone https://github.com/ansible/ansible-modules-extras.git
fi


cd ${LOCAL_DIR}/ansible
git checkout stable-${ansible_version}
python setup.py install

# cloning modules
cd ${LOCAL_DIR}/ansible-modules-core
git checkout stable-${ansible_version}
cd ${LOCAL_DIR}/ansible-modules-extras
git checkout stable-${ansible_version}

export ANSIBLE_LIBRARY=${LOCAL_DIR}/ansible-modules-core:${LOCAL_DIR}/ansible-modules-extras

sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/" /etc/ssh/sshd_config

service ssh restart