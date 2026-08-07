Day 07 – Linux File System Hierarchy

Objective

Understand where important files and directories are located in Linux and how they are used during troubleshooting.

Linux File System Hierarchy

/ – Root Directory

The root directory is the starting point of the Linux file system. All files and directories are organized under it.

cd /
ls -l /

/home – User Home Directories

Contains users' home directories and personal files.

ls -l /home

I would use this when I need to access or troubleshoot a user's personal files.

/root – Root User Home

The home directory of the root/administrator user.

ls -l /root

/etc – Configuration Files

Contains system-wide configuration files such as hostname, hosts, passwd, group and SSH configuration.

ls -l /etc
cat /etc/hostname

I would use this when troubleshooting system or service configuration.

/var – Variable Data

Contains changing data such as logs, cache, mail and application data.

ls -l /var

/var/log – Log Files

Contains system and application log files used during troubleshooting.

ls -l /var/log

/tmp – Temporary Files

Stores temporary files. These files may be removed automatically after reboot or by system cleanup.

ls -l /tmp

/usr – User Programs and Libraries

Contains installed applications, libraries, documentation and user commands.

ls -l /usr
ls -l /usr/bin

/bin – Essential Commands

Contains essential command binaries such as ls, cp, mv and cat.

ls -l /bin

/sbin – System Administration Commands

Contains essential system administration commands.

ls -l /sbin

/lib – Shared Libraries

Contains shared libraries required by programs in /bin and /sbin.

ls -l /lib

/opt – Optional/Third-Party Software

Used for optional or third-party software packages.

ls -l /opt

/boot – Boot Files

Contains files needed to boot the operating system.

ls -l /boot

/dev – Device Files

Contains device files representing hardware and virtual devices.

ls -l /dev

/proc – Process and Kernel Information

A virtual filesystem containing information about running processes and the Linux kernel.

ls -l /proc

/sys – Hardware and Kernel Information

A virtual filesystem providing hardware and kernel information.

ls -l /sys

/media – Removable Media

A common mount point for removable media such as USB drives.

ls -l /media

/mnt – Temporary Mount Point

A common location for temporarily mounted filesystems.

ls -l /mnt

Useful Commands

Find Large Log Files

du -sh /var/log/* 2>/dev/null | sort -h | tail -5

Check Hostname

cat /etc/hostname

Check Home Directory

ls -la ~

Key Learning

Understanding the Linux filesystem helps me quickly locate configuration files, logs, applications, processes and other important system information.
