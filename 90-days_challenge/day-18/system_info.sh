What is Strict Mode?
Strict mode is commonly enabled using:

set -euo pipefail

It makes Bash scripts safer by:

1. -e → stopping on command failure
2. -u → detecting undefined variables
3. pipefail → detecting failures inside pipelines


---

### 2. `system-info.md`

```markdown
# System Info Reporter

## Script: system_info.sh

```bash
#!/bin/bash

set -euo pipefail

hostname_os() {
    echo "====== HOSTNAME & OS ======"
    hostname
    grep PRETTY_NAME /etc/os-release
}

uptime_info() {
    echo "==== UPTIME ===="
    uptime
}

disk_usage() {
    echo "==== DISK USAGE ===="
    df -h /
}

memory_usage() {
    echo "==== MEMORY USAGE ===="
    free -h
}

top_cpu() {
    echo "==== TOP 5 CPU PROCESSES ===="
    ps aux --sort=-%cpu | head -6
}

main() {
    hostname_os
    uptime_info
    disk_usage
    memory_usage
    top_cpu
}

main

**OUTPUT**

====== HOSTNAME & OS ======
ubuntu
PRETTY_NAME="Ubuntu 24.04.4 LTS"

==== UPTIME ====
09:24:35 up 35 min, 0 user, load average: 0.00, 0.00, 0.00

==== DISK USAGE ====
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        19G  5.4G   13G  30% /

==== MEMORY USAGE ====
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       463Mi       780Mi       1.1Mi       827Mi       1.4Gi
Swap:          1.0Gi          0B       1.0Gi

==== TOP 5 CPU PROCESSES ====
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root        1288  0.2  0.6 1231484 13488 ?       S<l  08:49   0:04 /bin/runtime-info-service
root        1279  0.2  2.7 1243552 54464 ?       SNl  08:49   0:04 /opt/theia/node
root        1245  0.1  5.1 11761092 100108 ?     SNl  08:49   0:03 /opt/theia/node
root           1  0.1  0.6  22104 13344 ?        Ss   08:48   0:02 /sbin/init
root         642  0.0  2.3 1792760 46544 ?       Ssl  08:48   0:01 /usr/bin/containerd
