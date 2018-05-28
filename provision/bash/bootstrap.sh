#!/usr/bin/env bash

echo '>>>>running bootstrap.sh<<<<<<<'

echo 'running fdisk on /dev/sdc'
(
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)
echo w # Write changes
) | sudo fdisk /dev/sdc

echo 'running mkfs '
echo y | mkfs -t ext4 /dev/sdc

echo 'mounting to /data'
mkdir /data
chmod 777 /data
mount /dev/sdc  /data

echo '/dev/sdc    /data    ext4    defaults    0    0' >> /etc/fstab

echo 'settup up docker dir on /data'
mkdir -p /data/docker
chmod 777 /data/docker

#--------------------------

# echo 'running fdisk on /dev/sdb'
# (
# echo n # Add a new partition
# echo p # Primary partition
# echo 1 # Partition number
# echo   # First sector (Accept default: 1)
# echo   # Last sector (Accept default: varies)
# echo w # Write changes
# ) | sudo fdisk /dev/sdb

# echo 'running mkfs '
# echo y | mkfs -t ext4 /dev/sdb

# echo 'mounting to /data-two'
# mkdir /data-two
# chmod 777 /data-two
# mount /dev/sdb  /data-two

# echo '/dev/sdb    /data-two    ext4    defaults    0    0' >> /etc/fstab
