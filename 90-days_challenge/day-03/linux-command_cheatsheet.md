# Day 03 – Linux Commands Cheat Sheet

## 1. Process Management

- `ps`                 – running processes देखना
- `ps -ef`             – सभी processes की detailed information
- `ps aux`             – detailed process information
- `top`                – live process monitoring
- `kill PID`           – process को terminate करना
- `kill -9 PID`        – process को forcefully terminate करना
- `pgrep process-name` – process का PID ढूँढना
- `jobs`               – background jobs देखना
- `bg`                 – job को background में भेजना
- `fg`                 – job को foreground में लाना
- `nohup command &`    – logout के बाद भी process चलाना

## 2. File System

- `pwd`      – current directory देखना
- `ls`       – files और directories देखना
- `ls -l`    – detailed listing
- `ls -a`    – hidden files देखना
- `cd`       – directory बदलना
- `mkdir`    – directory बनाना
- `touch`    – file बनाना
- `cat`      – file का content देखना
- `head`     – शुरुआत की lines देखना
- `tail`     – आखिरी lines देखना
- `cp`       – file copy करना
- `mv`       – file move/rename करना
- `rm`       – file delete करना
- `rm -r`    – directory delete करना
- `find`     – file search करना
- `locate`   – जल्दी file search करना
- `df -h`    – disk usage देखना
- `du -sh`   – directory का size देखना

## 3. Networking Troubleshooting

- `ip addr`            – IP address देखना
- `ping google.com`    – network connectivity check करना
- `ssh user@server-ip` – remote server पर login करना
- `curl URL`           – HTTP response check करना
- `wget URL`           – file download करना
- `ss -tuln`           – listening ports देखना
- `hostname`           – system hostname देखना
- `nslookup domain`    – DNS lookup करना
- `traceroute domain`  – network path check करना
