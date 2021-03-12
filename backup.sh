#!/bin/bash

#backup function
function back(){
    mkdir -p /home/$USER/.back_util
    dir_to_back=$1
    len=${#dir_to_back}
    if [ $len -eq 0 ]
    then
        today=`date "+%Y-%m-%d_%T"`
        echo $PWD>restore_destination_file
        echo "Directory to backup : $PWD"
        echo "Backing up......"
        tar cvfz /home/$USER/.back_util/backup_arch_$today.tgz *
        echo "Backup finshed!"
        echo -n "Backup size : "
        wc -c</home/$USER/.back_util/backup_arch_$today.tgz
        rm restore_destination_file
    else
    	readlink -f $dir_to_back>$dir_to_back/restore_destination_file
        today=`date "+%Y-%m-%d_%T"`
        echo "Directory to backup : `readlink -f $dir_to_back`"
        echo "Backing up......"
        tar cvfz /home/$USER/.back_util/backup_arch_$today.tgz $dir_to_back
        echo "Backup finshed!"
        echo -n "Backup size : "
        wc -c</home/$USER/.back_util/backup_arch_$today.tgz
        rm $dir_to_back/restore_destination_file
    fi
}


















#restore from backup function
function restore(){
	ls /home/$USER/.back_util
}