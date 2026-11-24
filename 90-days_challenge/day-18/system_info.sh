## What is Strict Mode?

Strict mode in Bash is commonly enabled using:

```bash
set -euo pipefail
```

It makes Bash scripts safer by:

1. **`-e`** → Stopping immediately when any command fails (non-zero exit status).
2. **`-u`** → Detecting and throwing an error on undefined (unset) variables.
3. **`-o pipefail`** → Detecting failures anywhere inside pipelines (`|`), not just the last command.

---

# System Info Reporter

## Script: `system_info.sh`

```bash
#!/bin/bash
set -euo pipefail

get_os_info() {
    echo "Hostname : $(hostname)"
    echo "OS Info  : $(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f 2)"
    echo "Kernel   : $(uname -r)"
}

get_uptime() {
    echo "Uptime   : $(uptime -p)"
}

get_disk_usage() {
    df -h --output=source,size,used,avail,pcent,target | grep -v '^tmpfs\|^udev' | head -n 1
    df -h --output=source,size,used,avail,pcent,target | grep -v '^tmpfs\|^udev' | tail -n +2 | sort -k2 -hr | head -n 5
}

get_memory_usage() {
    free -h | awk 'NR==2 {print "Total: " $2 " | Used: " $3 " | Free: " $4 " | Available: " $7}'
}

get_top_cpu() {
    ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
}

main() {
    echo "=========================================="
    echo "         SYSTEM INFO REPORTER             "
    echo "=========================================="

    echo -e "\n--- 1. Hostname & OS Info ---"
    get_os_info

    echo -e "\n--- 2. System Uptime ---"
    get_uptime

    echo -e "\n--- 3. Top 5 Disk Usage (by Size) ---"
    get_disk_usage

    echo -e "\n--- 4. Memory Usage ---"
    get_memory_usage

    echo -e "\n--- 5. Top 5 CPU-Consuming Processes ---"
    get_top_cpu

    echo -e "\n=========================================="
}

main
```

## Sample Output

```text
==========================================
         SYSTEM INFO REPORTER             
==========================================

--- 1. Hostname & OS Info ---
Hostname : ubuntu
OS Info  : Ubuntu 24.04.4 LTS
Kernel   : 6.8.0-45-generic

--- 2. System Uptime ---
Uptime   : up 35 minutes

--- 3. Top 5 Disk Usage (by Size) ---
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        19G  5.4G   13G  30% /

--- 4. Memory Usage ---
Total: 1.9Gi | Used: 463Mi | Free: 780Mi | Available: 1.4Gi

--- 5. Top 5 CPU-Consuming Processes ---
    PID USER     %CPU %MEM COMMAND
   1288 root      0.2  0.6 runtime-info-se
   1279 root      0.2  2.7 node
   1245 root      0.1  5.1 node
      1 root      0.1  0.6 init
    642 root      0.0  2.3 containerd

==========================================
```
