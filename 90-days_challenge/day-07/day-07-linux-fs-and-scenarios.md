# Day 07 – Linux File System Hierarchy & Scenario-Based Practice

## Part 1: Linux File System Hierarchy

### Core Directories (Must Know)

1. **`/` (Root Directory)**
   - **What it contains:** The top-level starting point of the entire Linux file system hierarchy. Every file and directory branches out from here.
   - **Sample contents (`ls -l /`):** `bin`, `etc`, `home`, `var`, `usr`, `tmp`.
   - **I would use this when:** Navigating from the base of the file system or checking top-level system directories.

2. **`/home` (User Home Directories)**
   - **What it contains:** Personal directories, files, and environment configurations for regular users (e.g., `/home/ubuntu`).
   - **Sample contents (`ls -l /home`):** `ubuntu`, `praveen`.
   - **I would use this when:** Storing personal scripts, user-specific configs (`.bashrc`), or working as a non-root user.

3. **`/root` (Root User's Home Directory)**
   - **What it contains:** The personal home directory exclusively for the `root` (superuser/administrator), separate from `/home`.
   - **Sample contents (`ls -l /root`):** `practice`, `.ssh`, `.bashrc`.
   - **I would use this when:** Logged in as `root` and managing administrative scripts or root SSH keys.

4. **`/etc` (Configuration Files)**
   - **What it contains:** System-wide configuration files, user/group databases (`passwd`, `shadow`, `group`), and service configs (Nginx, SSH).
   - **Sample contents (`ls -l /etc`):** `hostname`, `hosts`, `passwd`, `ssh`, `nginx`.
   - **I would use this when:** Modifying application settings, network configs, or managing users and permissions.

5. **`/var/log` (Log Files)**
   - **What it contains:** Variable system and application log files (`syslog`, `auth.log`, `nginx/error.log`) that grow dynamically over time.
   - **Sample contents (`ls -l /var/log`):** `syslog`, `auth.log`, `journal`, `apt`.
   - **I would use this when:** Troubleshooting crashes, failed logins, or service errors in production.

6. **`/tmp` (Temporary Files)**
   - **What it contains:** Temporary files created by applications and users, which are usually cleared automatically upon reboot.
   - **Sample contents (`ls -l /tmp`):** `systemd-private-*`, temporary lock/socket files.
   - **I would use this when:** Storing short-lived test files, downloads, or scratch data during debugging.

---

### Additional & System Directories (Good to Know)

7. **`/bin` (Essential User Binaries)**
   - **What it contains:** Essential basic user commands needed even in single-user/recovery mode (`ls`, `cp`, `mv`, `cat`, `bash`).
   - **Sample contents (`ls -l /bin`):** `bash`, `ls`, `cat`, `grep`.
   - **I would use this when:** Checking where core Linux commands live or debugging `$PATH` issues.

8. **`/sbin` (System Binaries)**
   - **What it contains:** Essential system administration binaries mostly used by `root` (`iptables`, `reboot`, `fdisk`, `ip`).
   - **I would use this when:** Performing low-level system, disk, or network administration tasks.

9. **`/usr` & `/usr/bin` (Unix System Resources)**
   - **What it contains:** Secondary hierarchy holding read-only user utilities, libraries, and installed software binaries (`python3`, `git`, `curl`).
   - **Sample contents (`ls -l /usr/bin`):** `python3`, `git`, `top`, `ssh`.
   - **I would use this when:** Finding binaries for user-installed packages and tools.

10. **`/opt` (Optional / Third-Party Software)**
    - **What it contains:** Add-on or third-party enterprise software packages that don't follow standard distro layouts (e.g., custom agents, Java apps).
    - **I would use this when:** Installing external tools like monitoring agents, custom binaries, or vendor software.

11. **`/boot` (Boot Loader Files)**
    - **What it contains:** Linux kernel (`vmlinuz`), `initrd`, and GRUB bootloader configuration files (editable only by `root`/`sudo`).
    - **I would use this when:** Troubleshooting kernel updates or boot-level startup issues.

12. **`/lib` & `/lib64` (Shared Libraries)**
    - **What it contains:** Essential shared libraries and kernel modules needed by binaries in `/bin` and `/sbin`.
    - **I would use this when:** Debugging missing shared library errors (`.so` files) for system commands.

13. **`/dev` (Device Files)**
    - **What it contains:** Special device files representing hardware components like disks (`/dev/sda`), terminals (`/dev/tty`), and `/dev/null`.
    - **I would use this when:** Checking attached storage disks or discarding unwanted command output (`2>/dev/null`).

14. **`/proc` & `/sys` (Virtual Kernel & Hardware Filesystems)**
    - **What it contains:** Virtual files generated in memory showing live kernel/process info (`/proc/cpuinfo`, `/proc/meminfo`) and hardware/device tree info (`/sys`).
    - **I would use this when:** Inspecting live CPU/RAM metrics or kernel parameters directly.

15. **`/mnt` & `/media` (Mount Points)**
    - **What it contains:** `/mnt` is for temporary manual mounts by admins; `/media` is for automatic mounting of removable drives (USB/CD).
    - **I would use this when:** Mounting an external EBS volume, ISO, or network share.

16. **`/run` & `/srv` & `/snap` & `swapfile`**
    - **`/run`:** Volatile runtime data like PID files and sockets since last boot.
    - **`/srv`:** Site-specific data served by the system (e.g., web or FTP data).
    - **`/snap`:** Mount points and files for Ubuntu Snap packages.
    - **`/swapfile`:** Disk file used as virtual memory (swap space) when physical RAM fills up.

---

### Hands-On Tasks Output Summary
```bash
# 1. Find largest log files in /var/log
du -sh /var/log/* 2>/dev/null | sort -h | tail -5

# 2. Check system hostname config in /etc
cat /etc/hostname

# 3. Inspect hidden and regular files in home directory
ls -la ~
```

---

## Part 2: Scenario-Based Practice

### Scenario 1: Service Not Starting
**Problem:** A web application service called `myapp` failed to start after a server reboot.

- **Step 1:** `systemctl status myapp`
  - **Why:** To check whether the service is currently `failed`, `inactive`, or `active`, and see the exit code.
- **Step 2:** `journalctl -u myapp -n 50 --no-pager`
  - **Why:** To inspect the last 50 log lines of `myapp` and find the exact startup error message.
- **Step 3:** `systemctl is-enabled myapp`
  - **Why:** To verify if the service was configured to start automatically on system boot.
- **Step 4:** `sudo systemctl enable --now myapp`
  - **Why:** To enable the service for future reboots and immediately start it now (then verify again with `systemctl status myapp`).

---

### Scenario 2: High CPU Usage
**Problem:** The application server is slow. Identify which process is consuming high CPU.

- **Step 1:** `uptime`
  - **Why:** To quickly check the 1, 5, and 15-minute system load averages.
- **Step 2:** `top` (or `htop`)
  - **Why:** To monitor live CPU utilization in real time and spot the top CPU-consuming process and its PID.
- **Step 3:** `ps aux --sort=-%cpu | head -10`
  - **Why:** To get a clean snapshot of the top 10 processes sorted by highest CPU percentage.

---

### Scenario 3: Finding Service Logs
**Problem:** A developer asks where the logs for the `docker` service (managed by `systemd`) are located.

- **Step 1:** `systemctl status docker`
  - **Why:** To verify if the Docker daemon is running and see its most recent status snippet.
- **Step 2:** `journalctl -u docker -n 50 --no-pager`
  - **Why:** Since Docker is managed by `systemd`, its daemon logs are stored in `journald` (on disk at `/var/log/journal/`). This shows the last 50 log entries.
- **Step 3:** `journalctl -u docker -f`
  - **Why:** To stream/follow new Docker service logs in real time while debugging.

---

### Scenario 4: File Permissions Issue
**Problem:** Running `./backup.sh` at `/home/user/backup.sh` gives `Permission denied`.

- **Step 1:** `ls -l /home/user/backup.sh`
  - **Why:** To check current permissions (e.g., `-rw-r--r--` shows that execute `x` permission is missing).
- **Step 2:** `chmod +x /home/user/backup.sh` (or `chmod 755 /home/user/backup.sh`)
  - **Why:** To grant execute (`x`) permission so the script can be run as a program.
- **Step 3:** `ls -l /home/user/backup.sh`
  - **Why:** To verify that permissions updated to `-rwxr-xr-x`.
- **Step 4:** `/home/user/backup.sh` (or `./backup.sh`)
  - **Why:** To execute the script and confirm the `Permission denied` error is resolved.
