#!/bin/bash

# Checking root
if [ ! "$(whoami)" == "root" ];
then
    echo -e "\nPlease run as root...\n"; exit 1
fi

# Checking the current working directory
if [ ! -f "${PWD}/site.yml" ];
then
    echo -e "\nFile site.yml missing...Please check the working directory\n"
    exit 1
fi

LOCAL_DIR=${PWD}
source $LOCAL_DIR/var.ini

# finding os
if [ $(cat /etc/*-release | grep -i "Ubuntu" | wc -l) -ne 0 ]; then
	sh $LOCAL_DIR/init_Ubuntu.sh
elif [ $(cat /etc/*-release | grep -i "SuSE" | wc -l) -ne 0 ]; then
	sh $LOCAL_DIR/init_SuSE.sh
fi

sh $LOCAL_DIR/ansible_installation.sh
