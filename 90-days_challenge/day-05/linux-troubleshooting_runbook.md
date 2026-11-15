# Day 05 – Linux Troubleshooting Runbook

## Target Service
- **Primary Service:** SSH (`ssh.service`)
- **Secondary Service Tested:** Nginx (`nginx.service`)
- **Host / Gateway:** Ubuntu Lab VM (`172.30.1.2` | Gateway: `172.30.1.1`)

## Objective
Quickly check the health of a Linux system (CPU, memory, disk, network), identify running processes, verify a service, and review logs using practical troubleshooting commands.

---

## 1. System Health Check

### Commands
```bash
ps
ps -ef
```

### Observation
- **`ps`:** Displayed the processes running in the current terminal session.
- **`ps -ef`:** Displayed all running processes with PID, PPID, user, and command information.

---

## 2. CPU, Memory, and Disk Check

### Commands
```bash
top
uptime
free -h
df -h
```

### Actual Output & Observation
- **`top`:**
  - CPU idle: approximately `99.7%`
  - Memory available: approximately `1483.6 MiB`
  - Swap available: `1024 MiB`
  - Total tasks: `125` | Zombie processes: `0`
- **`uptime`:** `05:36:29 up 1:27, 0 user, load average: 0.00, 0.01, 0.00`
- **`free -h`:** `1.9Gi` total RAM (`421Mi` used, `1.4Gi` available) and `1.0Gi` Swap (`0B` used).
- **`df -h`:** Verified root filesystem (`/`) disk space was healthy with no storage pressure.
- **Observation:** The system was completely healthy with negligible CPU load and plenty of free memory.

---

## 3. Find SSH Process & Resource Usage

### Commands
```bash
pgrep ssh
systemd-cgtop -n 1 --depth=2
```

### Actual Output & Observation
- **`pgrep ssh` Output:** `898` (and `1164` for parent listener daemon in subsequent session).
- **`systemd-cgtop` Output:** `system.slice/ssh.service` utilized `238.5M` memory and `1min 13.857s` total CPU time.
- **Observation:** Identified the exact PIDs for the SSH process and verified its cgroup-level CPU/memory footprint.

---

## 4. Check SSH Service

### Command
```bash
systemctl status ssh
```

### Observation
- The SSH service (`ssh.service`) was **active and running** (`ExecStartPre=/usr/sbin/sshd -t` passed with status `0/SUCCESS`).
- The SSH server was actively listening on port `22`. *(Note: On Ubuntu, the service name is `ssh`, not `sshd`).*

---

## 5. Network Connectivity & Port Verification

### Commands
```bash
ip route | grep default
ping -c 4 172.30.1.1
ss -tulnp | grep ssh
```

### Actual Output & Observation
- **Default Gateway (`ip route`):** `default via 172.30.1.1 dev enp1s0`
- **Gateway Ping (`172.30.1.1`):** `4 packets transmitted, 4 received, 0% packet loss, avg rtt 0.116 ms`
- **Listening Ports (`ss -tulnp`):** `sshd` listening on `0.0.0.0:22` (IPv4) and `[::]:22` (IPv6).
- **Observation:** Network routing and gateway connectivity were healthy with zero packet loss, and port `22` was confirmed open.

---

## 6. Stop and Verify SSH

### Commands
```bash
systemctl stop ssh
systemctl is-active ssh
```

### Output & Observation
- **Output:** `inactive`
- **Observation:** The service became inactive after stopping it. This confirmed that `systemctl is-active` can be used to quickly verify the current service state.

---

## 7. Start SSH Again

### Commands
```bash
systemctl start ssh
systemctl is-active ssh
```

### Observation
- **Output:** `active`
- **Observation:** The SSH service was started successfully again.

---

## 8. Enable SSH at Boot

### Commands
```bash
systemctl enable ssh
systemctl is-enabled ssh
```

### Output & Observation
- **Output:** `enabled`
- **Observation:** SSH was enabled to start automatically during system boot.

---

## 9. Check Nginx Service

### Commands
```bash
systemctl status nginx
sudo apt-get install nginx -y
```

### Observation
- Initially, `nginx` was not installed (`Unit nginx.service could not be found`).
- Installed `nginx` using `sudo apt-get install nginx -y`.
- After installation, the `nginx` service became **active and running**.

---

## 10. Review SSH Logs

### Command
```bash
journalctl -u ssh -n 20 --no-pager
```

### Observation
- The SSH logs showed clean service startup (`Server listening on 0.0.0.0 port 22`) and successful SSH password logins (`Accepted password for root`).
- Also spotted a minor warning (`sudo: unable to resolve host vm2: Name or service not known`), which does not impact SSH functionality.

---

## 11. Review Logs by Time

### Commands
```bash
journalctl --since "1 hour ago"
journalctl --since today
journalctl --since "1 minute ago"
```

### Observation
- **`--since "1 hour ago"`:** Displayed journal entries from the last one hour, including kernel and system startup information.
- **`--since today`:** Displayed all of today's journal entries.
- **`--since "1 minute ago"`:** Initially showed no entries; when run again later, recent system events were displayed.

---

## Quick Findings
- CPU usage was very low (`99.7%` idle, load average `0.00`).
- Memory (`1.4Gi` available) and swap (`1.0Gi` free) were healthy.
- Disk space (`df -h`) showed no capacity issues.
- Network gateway (`172.30.1.1`) was reachable with `0%` packet loss.
- No zombie processes were observed (`0` zombies).
- SSH was successfully running and listening on port `22` (`0.0.0.0:22` & `[::]:22`).
- SSH was successfully stopped, started, and enabled at boot.
- SSH logs showed successful connections.
- Nginx was successfully installed and started.
- `journalctl` was used to investigate service-specific and time-based logs.

---

## If This Worsens
If the problem becomes worse, I would:
1. Check CPU, memory, and disk usage using `top`, `uptime`, `free -h`, `df -h`, and `systemd-cgtop`.
2. Check the service status and configuration syntax using `systemctl status <service>` and `sshd -t`.
3. Review recent errors using `journalctl -u <service> -n 50 --no-pager`.
4. Check network connectivity, routing, and listening ports using `ip a`, `ip route`, `ping`, and `ss -tulnp`.
5. Check firewall rules using `ufw status` or `iptables -L -n`.
6. Restart the affected service (`systemctl restart <service>`) if appropriate.
7. If the issue continues, investigate system and kernel logs using `journalctl -p err -b` and escalate.

---

## Appendix A: Reusable Dynamic Runbook Script (Works for Any Service)
To capture this exact health snapshot for **any service** without hardcoding a service name, save and execute this script:

```bash
#!/bin/bash
read -p "Enter service name (e.g., ssh, nginx, cron): " SVC
GATEWAY=\$(ip route | awk '/default/ {print \$3}' | head -n 1)
REPORT="runbook_\({SVC}_\)(date +%F_%H-%M).md"

{
  echo "# Incident Runbook: \${SVC}.service"
  echo "**Generated:** \$(date)"
  echo "## 1. Service Status"; systemctl status "\$SVC" --no-pager | head -n 15
  echo "## 2. CPU & Memory"; uptime; free -h
  echo "## 3. Disk Usage"; df -h /
  echo "## 4. Network & Ports"; ping -c 2 "GATEWAY"; ss -tulnp | grep -i "SVC"
  echo "## 5. Recent Logs"; journalctl -u "\$SVC" -n 15 --no-pager
} > "\$REPORT"

echo "Runbook saved to \$REPORT"
```

---

## Appendix B: 50+ Linux Troubleshooting Commands Reference

| Category | Commands & Purpose |
| :--- | :--- |
| **CPU & Process** | `uptime` (load avg), `top` (live processes), `htop` (interactive monitor), `ps` (session processes), `ps -ef` (full process list), `ps aux` (BSD format CPU/MEM), `pgrep -a <name>` (find PID), `mpstat -P ALL 1` (per-core CPU), `vmstat 1` (system stats), `pidstat 1` (process stats), `lscpu` (CPU specs), `nice` (set priority), `kill -9 <PID>` (force stop). |
| **Memory & Swap** | `free -h` (RAM/swap summary), `cat /proc/meminfo` (kernel memory), `swapon --show` (swap details), `slabtop` (kernel slab cache), `smem -tk` (PSS/USS RAM), `dmesg -T \| grep -i oom` (OOM killer logs), `ps -eo pid,comm,%mem --sort=-%mem \| head` (top RAM consumers). |
| **Disk & I/O** | `df -h` (disk space), `df -i` (inode usage), `du -sh *` (folder size), `lsblk` (block devices), `iostat -xz 1` (disk I/O latency), `iotop` (live disk I/O), `lsof +L1` (deleted open files), `mount \| column -t` (mounted filesystems). |
| **Network & Ports** | `ip a` (IP addresses), `ip route` (routing/gateway), `ping -c 4 <IP>` (connectivity), `ss -tulnp` (listening ports), `netstat -tulnp` (legacy ports), `traceroute <host>` (hop path), `mtr <host>` (live path + loss), `dig <domain>` (DNS lookup), `nslookup <domain>` (DNS query), `curl -Iv <url>` (HTTP status), `tcpdump -i any port 80` (packet capture), `ufw status` (firewall), `iptables -L -n` (kernel firewall). |
| **Services & Logs** | `systemctl status <svc>` (service health), `systemctl is-active <svc>` (active check), `systemctl is-enabled <svc>` (boot check), `systemctl list-units --failed` (failed units), `systemd-cgtop` (service CPU/RAM), `systemd-analyze blame` (boot timing), `journalctl -u <svc> -n 20` (service logs), `journalctl -f` (live logs), `journalctl -p err -b` (boot errors), `journalctl --since "1 hour ago"` (time filter), `strace -p <PID>` (system call trace). |

---

## Conclusion
This troubleshooting drill helped me practice a repeatable Linux troubleshooting workflow:

**Check → Observe → Investigate Logs → Take Action → Verify**

The main commands practiced were:
`ps`, `ps -ef`, `top`, `uptime`, `free -h`, `df -h`, `pgrep`, `systemd-cgtop`, `systemctl`, `ip route`, `ping`, `ss -tulnp`, `journalctl`, and `nginx` service management.
