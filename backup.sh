#!/bin/bash
#backup function
function back(){
    mkdir -p /home/$USER/.back_util
    today=`date "+%Y-%m-%d_%T"`
    echo $PWD>restore_destination_file
    echo "Directory to backup : $PWD"
    echo "Backing up......"
    tar cvfz /home/$USER/.back_util/backup_arch_$today.tgz *
    echo "Backup finshed!"
    echo -n "Backup size : "
    wc -c</home/$USER/.back_util/backup_arch_$today.tgz
    rm restore_destination_file
}

#restore from backup function
function restore(){
    ls /home/$USER/.back_util
    echo -n "Enter the name of the backup file : "
    read file_name
    echo "Restoring......"
    tar xvfz /home/$USER/.back_util/$file_name restore_destination_file
    destination=`cat restore_destination_file`
    mkdir -p $destination
    rm restore_destination_file
    tar xvfz /home/$USER/.back_util/$file_name -C $destination
    rm $destination/restore_destination_file
    echo "Restoration completed!"
}