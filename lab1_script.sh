!/bin/bash

# Mount a backup drive
mount -t auto /dev/xvdf /mnt/
#
# Backs up files in the directory /home to the backup drive
rsync -ra /home/ /dev/xvdf
#
# Unmount the drive
umount /mnt/

