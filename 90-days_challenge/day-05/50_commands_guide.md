
# 55 Essential Linux Troubleshooting Commands (CPU, Memory, Disk, Network, Services & Logs)

## A. CPU & Process Monitoring (1-12)
1. `uptime` - System kitni der se chal raha hai aur 1, 5, 15 minute ka CPU load average dikhata hai.
2. `top` - Real-time mein CPU aur memory use karne wale processes ki live list dikhata hai.
3. `htop` - Interactive aur color-coded process viewer (top ka advanced version).
4. `ps aux` - System par chal rahe sabhi processes ka snapshot aur unka %CPU, %MEM dikhata hai.
5. `ps -ef` - Full format mein sabhi running processes aur unke Parent PID (PPID) dikhata hai.
6. `ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head` - Sabse zyada CPU lene wale top processes sort karke dikhata hai.
7. `mpstat -P ALL 1` - Har ek CPU core ka individual utilization dikhata hai.
8. `vmstat 1 5` - Process, memory, paging, block IO, aur CPU activity ka summary har second dikhata hai.
9. `pidstat 1` - Individual processes ke CPU aur I/O stats ko real-time track karta hai.
10. `lscpu` - CPU architecture, cores, threads, aur model ki poori jaankari deta hai.
11. `nice -n 10 <cmd>` - Kisi process ko kam ya zyada CPU priority ke saath start karta hai.
12. `kill -9 <PID>` - Kisi hung ya high-CPU process ko forcefully terminate karta hai.

## B. Memory & Swap Analysis (13-20)
13. `free -h` - Total, used, free, aur available RAM aur Swap ko human-readable (GB/MB) format mein dikhata hai.
14. `cat /proc/meminfo` - Kernel ki memory usage aur buffers/cache ki deep technical details dikhata hai.
15. `smem -tk` - Processes ki actual physical memory (PSS/USS) usage calculate karke dikhata hai.
16. `slabtop` - Kernel slab cache memory usage ko real-time mein dikhata hai.
17. `swapon --show` - Active swap partitions aur files ki details dikhata hai.
18. `ps -eo pid,comm,%mem --sort=-%mem | head` - Sabse zyada RAM kharch karne wale top processes dikhata hai.
19. `dmesg -T | grep -i -E 'oom|kill'` - Check karta hai ki Out-Of-Memory (OOM) killer ne kisi process ko band toh nahi kiya.
20. `sync; echo 3 > /proc/sys/vm/drop_caches` - Safe tarike se Linux page cache aur buffers clear karta hai.

## C. Disk & Filesystem Troubleshooting (21-30)
21. `df -h` - Sabhi mounted partitions ka total, used, aur available disk space dikhata hai.
22. `df -i` - Disk par free inodes check karta hai (agar space ho par file na bane toh inode full hote hain).
23. `du -sh *` - Current folder ke andar har file aur directory ka total size dikhata hai.
24. `du -ah /var/log | sort -rh | head -n 10` - Sabse badi 10 log files dhoondh kar nikalta hai.
25. `lsblk` - System se jude sabhi storage drives aur partitions ka tree structure dikhata hai.
26. `iostat -xz 1` - Disk ki read/write speed aur I/O bottleneck (await time) check karta hai.
27. `iotop` - Real-time mein kaunsa process sabse zyada disk read/write kar raha hai, yeh dikhata hai.
28. `lsof +L1` - Aisi deleted files dikhata hai jo abhi bhi kisi process dwara open hain aur disk space ghere hue hain.
29. `mount | column -t` - System par mounted sabhi filesystems aur unke permissions (ro/rw) dikhata hai.
30. `fsck /dev/sdX` - Corrupted filesystem ko check aur repair karta hai (unmounted disk par).

## D. Network Diagnostics & Ports (31-43)
31. `ip a` (ya `ip addr`) - Sabhi network interfaces (eth0, enp1s0, lo) aur unke IP addresses dikhata hai.
32. `ip route` - System ka routing table aur default gateway IP dikhata hai.
33. `ping -c 4 <IP/Domain>` - Kisi server ya gateway tak network connectivity aur packet loss check karta hai.
34. `ss -tulnp` - System par open TCP/UDP ports aur unhe listen karne wali services/PIDs dikhata hai.
35. `netstat -tulnp` - Open ports aur active network connections dekhne ka classic command.
36. `traceroute <Domain/IP>` - Packet destination tak pahunchne mein kin-kin routers (hops) se guzarta hai, yeh dikhata hai.
37. `mtr <Domain/IP>` - Ping aur traceroute ko mila kar real-time network latency aur packet loss dikhata hai.
38. `dig <Domain>` - DNS resolution aur nameserver records ki detailed troubleshooting karta hai.
39. `nslookup <Domain>` - Domain name se IP address aur DNS server query karta hai.
40. `curl -Iv <URL>` - Kisi web service ke HTTP response headers aur connection status check karta hai.
41. `tcpdump -i any port 80` - Network interface par aane-jaane wale live packets capture karta hai.
42. `ufw status verbose` - Ubuntu firewall (UFW) ke active rules aur status dikhata hai.
43. `iptables -L -n -v` - Kernel firewall ke sabhi packet filtering rules aur packet counts dikhata hai.

## E. Systemd Services & Log Tracing (44-55)
44. `systemctl status <service>` - Kisi service ka active status, PID, memory, CPU time, aur recent logs dikhata hai.
45. `systemctl list-units --type=service --state=running` - System par chal rahi sabhi active services ki list dikhata hai.
46. `systemctl list-units --failed` - Jin services mein error aaya hai ya jo fail hui hain, unki list dikhata hai.
47. `systemd-cgtop` - Control groups (services) ke hisab se real-time CPU, Memory, aur I/O usage dikhata hai.
48. `systemd-analyze blame` - Boot hone mein kis service ne kitna time liya, iski list dikhata hai.
49. `journalctl -u <service> -n 50 --no-pager` - Kisi specific service ke aakhiri 50 log lines bina rukawat dikhata hai.
50. `journalctl -u <service> -f` - Kisi service ke naye logs ko real-time (live tail) mein monitor karta hai.
51. `journalctl -p err -b` - Current boot ke dauran aaye sabhi critical errors aur alerts dikhata hai.
52. `journalctl --since "1 hour ago"` - Pichle 1 ghante ke saare system aur service logs filter karke dikhata hai.
53. `tail -f /var/log/syslog` - General system logs ko live monitor karta hai.
54. `grep -i "error" /var/log/syslog` - System log file mein se saari error lines search karke nikalta hai.
55. `strace -p <PID>` - Kisi running process ke system calls ko live trace karke hang hone ka kaaran pakadta hai.
