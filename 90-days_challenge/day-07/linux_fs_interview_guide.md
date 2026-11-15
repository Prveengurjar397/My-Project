# Linux File System – High-Probability DevOps Interview Guide (50%+ Chance)

> **Golden Rule for Interviews:** Interviewer ko 20 directories ki list nahi chahiye. Har answer mein sirf 3 cheezein bolein:
> 1. **Kya rehta hai?** (1 line)
> 2. **Example file/folder?** (1–2 names)
> 3. **Real-world use / Troubleshooting?** (1 line)

---

## Part 1: Top 8 Directories (90% Sawal Yahin Se Aate Hain)

### 1. `/etc` (Configurations) — *Chance: 95%*
- **Interview mein kaise bolein:**
  > *"Sir, `/etc` mein system aur applications ki saari configuration files store hoti hain. Jaise users ki details `/etc/passwd` mein, DNS `/etc/resolv.conf` mein, aur Nginx ya SSH ki settings `/etc/nginx` aur `/etc/ssh` mein rehti hain. Jab bhi humein kisi service ka port ya setting change karni hoti hai, hum `/etc` check karte hain."*

### 2. `/var/log` (Logs) — *Chance: 95%*
- **Interview mein kaise bolein:**
  > *"Sir, `/var/log` mein system aur applications ke saare logs store hote hain, jaise `/var/log/syslog`, `/var/log/auth.log`, ya `/var/log/nginx/error.log`. Jab bhi koi server slow hota hai, service crash hoti hai, ya disk full hoti hai, toh debugging ke liye sabse pehle hum `/var/log` hi check karte hain."*

### 3. `/tmp` (Temporary Files) — *Chance: 80%*
- **Interview mein kaise bolein:**
  > *"Sir, `/tmp` mein temporary files rakhi jaati hain jo applications ya users testing ke liye banate hain, aur system reboot hone par yeh clear ho jaati hain. Agar server ki disk full ho rahi ho, toh hum `/var/log` ke saath `/tmp` bhi clean karte hain."*

### 4. `/home` vs `/root` (User Directories) — *Chance: 75%*
- **Interview mein kaise bolein:**
  > *"Sir, `/home` mein normal users ke personal folders aur files rehti hain (jaise `/home/ubuntu`), jabki `/root` sirf root (admin) user ka home folder hota hai. Security ke liye normal users `/root` ko access nahi kar sakte."*

### 5. `/bin` vs `/sbin` vs `/usr/bin` (Commands & Binaries) — *Chance: 70%*
- **Interview mein kaise bolein:**
  > *"Sir, `/bin` mein basic user commands hoti hain jaise `ls`, `cp`, `cat`. `/sbin` mein system admin commands hoti hain jaise `reboot` ya `iptables`. Aur `/usr/bin` mein woh software binaries hoti hain jo hum baad mein install karte hain, jaise `git` ya `python3`."*

### 6. `/opt` (Third-Party Software) — *Chance: 65%*
- **Interview mein kaise bolein:**
  > *"Sir, `/opt` mein hum third-party ya external software install karte hain jo OS ke saath default nahi aate, jaise koi monitoring agent (Datadog/Prometheus) ya custom enterprise application."*

### 7. `/proc` (Virtual System & Process Info) — *Chance: 60%*
- **Interview mein kaise bolein:**
  > *"Sir, `/proc` ek virtual file system hai jo hard disk par space nahi leta, balki RAM mein live kernel aur running processes ki info dikhata hai. Jaise live CPU info ke liye `/proc/cpuinfo` aur RAM ke liye `/proc/meminfo`."*

### 8. `/dev` & `/mnt` (Devices & Mounts) — *Chance: 55%*
- **Interview mein kaise bolein:**
  > *"Sir, `/dev` mein hardware devices ki files hoti hain jaise hard disk (`/dev/sda`) ya `/dev/null`. Aur `/mnt` ka use hum tab karte hain jab humein koi external disk ya volume temporarily mount karna hota hai."*

---

## Part 2: Top 5 Scenario Questions (50%+ Chance in DevOps Interviews)

### Q1: "Server ki disk 100% full dikha rahi hai (`df -h`), tum sabse pehle kin folders ko check karoge?"
- **Interview Answer:**
  > *"Sir, main sabse pehle `/var/log` check karunga kyunki application logs ya syslog bahut bade ho jaate hain. Uske baad `/tmp` aur `/home` check karunga ki kahin koi badi backup ya temporary file toh nahi padi hai. Iske liye main `du -sh /var/log/* | sort -h` command use karunga."*

### Q2: "Agar koi service (jaise Nginx ya myapp) start nahi ho rahi, toh tum kya check karoge?"
- **Interview Answer:**
  > *"Sir, sabse pehle `systemctl status <service>` se uska state aur exit code check karunga. Phir exact error dekhne ke liye `journalctl -u <service> -n 50` ya `/var/log` mein uske logs check karunga. Agar config issue hoga toh `/etc/<service>` mein jaakar syntax validate karunga."*

### Q3: "Ek developer kehta hai ki uski script `./backup.sh` run karne par 'Permission denied' aa raha hai, kaise fix karoge?"
- **Interview Answer:**
  > *"Sir, pehle main `ls -l backup.sh` se check karunga ki uske paas execute (`x`) permission hai ya nahi. Phir `chmod +x backup.sh` command se execute permission dekar script run karunga."*

### Q4: "Application server bahut slow chal raha hai, kaise pata karoge kaunsa process high CPU le raha hai?"
- **Interview Answer:**
  > *"Sir, main server par SSH karke `uptime` se load average check karunga, aur `top` ya `ps aux --sort=-%cpu | head -10` command chalakar top CPU-consuming process ka PID nikalunga."*

