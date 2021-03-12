#!/bin/bash
function back(){
    mkdir -p /home/$USER/.back_util
    dir_to_back=$1
    len=${#dir_to_back}
    if [ $len -eq 0 ]
    then
        today=`date "+%Y-%m-%d_%T"`
        echo "Directory to backup : $PWD"
        echo "Backing up......"
        tar cvfz /home/$USER/.back_util/backup_arch_$today.tgz *
        echo "Backup finshed!"
        echo -n "Backup size : "
        wc -c</home/$USER/.back_util/backup_arch_$today.tgz
    else
        today=`date "+%Y-%m-%d_%T"`
        echo "Directory to backup : $dir_to_back"
        echo "Backing up......"
        tar cvfz /home/$USER/.back_util/backup_arch_$today.tgz $dir_to_back
        echo "Backup finshed!"
        echo -n "Backup size : "
        wc -c</home/$USER/.back_util/backup_arch_$today.tgz
    fi
}