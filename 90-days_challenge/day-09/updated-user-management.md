# Day 09 – Linux User & Group Management Challenge

## Task
Today I practiced Linux user and group management by creating users, groups, assigning group memberships, setting up shared directories with group permissions, and debugging real permission/environment issues.

---

## Users & Groups Created

### Users
- `tokyo`
- `berlin`
- `professor`
- `nairobi`

### Groups
- `developers`
- `admins`
- `project-team`

---

## Group Assignments & Directories Summary

| User | Assigned Groups | Home Directory |
| :--- | :--- | :--- |
| **`tokyo`** | `developers`, `project-team` | `/home/tokyo` |
| **`berlin`** | `developers`, `admins` | `/home/berlin` |
| **`professor`** | `admins` | `/home/professor` |
| **`nairobi`** | `project-team` | `/home/nairobi` |

| Directory | Owner (`User:Group`) | Permissions | Purpose |
| :--- | :--- | :--- | :--- |
| **`/opt/dev-project`** | `root:developers` | `775` (`drwxrwxr-x`) | Shared workspace for `developers` (`tokyo` and `berlin`). |
| **`/opt/team-workspace`** | `root:project-team` | `775` (`drwxrwxr-x`) | Shared workspace for `project-team` (`nairobi` and `tokyo`). |

---

## Task 1 – Create Users & Set Passwords

Created users with home directories (`-m`) and bash shell (`-s /bin/bash`), then set passwords:

```bash
sudo useradd -m -s /bin/bash tokyo
sudo useradd -m -s /bin/bash berlin
sudo useradd -m -s /bin/bash professor
sudo useradd -m -s /bin/bash nairobi

sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi
```

Verified users in `/etc/passwd` and `/home`:

```bash
grep -E "tokyo|berlin|professor|nairobi" /etc/passwd
ls -l /home/
```

---

## Task 2 – Create Groups

Created the required groups:

```bash
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```

Verified groups in `/etc/group`:

```bash
grep -E "developers|admins|project-team" /etc/group
```

---

## Task 3 – Assign Users to Groups

Assigned supplementary groups using `usermod -aG`:

```bash
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```

Verified group memberships using `groups` and `id`:

```bash
groups tokyo berlin professor nairobi
id tokyo
id berlin
id professor
id nairobi
```

---

## Task 4 – Shared Directory (`/opt/dev-project`)

Created the shared directory, assigned group ownership to `developers`, and set permissions to `775`:

```bash
sudo mkdir -p /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project
```

Verified ownership and permissions:

```bash
ls -ld /opt/dev-project
```

Output:
```text
drwxrwxr-x 2 root developers 4096 Nov 16 04:34 /opt/dev-project
```

### File Creation Test (`tokyo` & `berlin`)
Tested both via user switching (`su - <user>`) and `sudo -u`:

```bash
sudo -u tokyo touch /opt/dev-project/tokyo.txt
sudo -u berlin touch /opt/dev-project/berlin.txt
ls -la /opt/dev-project
```

Both users successfully created files inside `/opt/dev-project`.

---

## Task 5 – Team Workspace (`/opt/team-workspace`)

Created `/opt/team-workspace`, set group owner to `project-team`, and granted `775` permissions:

```bash
sudo mkdir -p /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
```

Verified directory permissions:

```bash
ls -ld /opt/team-workspace
```

### File Creation Test (`nairobi`)

```bash
sudo -u nairobi touch /opt/team-workspace/nairobi.txt
ls -la /opt/team-workspace
```

Output confirmed:
```text
drwxrwxr-x 2 root project-team 4096 Nov 16 04:40 /opt/team-workspace
-rw-rw-r-- 1 nairobi nairobi     0 Nov 16 04:40 nairobi.txt
```

---

## Commands Practiced

```bash
useradd -m -s /bin/bash
passwd
mkhomedir_helper
groupadd
usermod -aG
groups
id
su - <username>
cat /etc/passwd
cat /etc/group
ls -l /home
mkdir -p
chown
chgrp
chmod 775
sudo -u
ls -ld
```

---

## Troubleshooting & Mistakes I Fixed

### 1. Missing Home Directory (`useradd` without `-m`) & Ugly Prompt
- **Problem:** Initially created `tokyo` without `-m`, so `/home/tokyo` did not exist and the default shell was `/bin/sh` (showing raw escape codes `\[\033[01;32m\]`).
- **Solution:** Generated the home directory with `sudo mkhomedir_helper tokyo` and updated the login shell using `sudo usermod -s /bin/bash tokyo`.

### 2. `su tokyo` vs `su - tokyo` (`Permission denied` in `/root`)
- **Problem:** Running `su tokyo` without a hyphen (`-`) switched the user to `tokyo` but kept the working directory inside `/root`, causing `touch hello.txt` to fail with `Permission denied`.
- **Solution:** Used `su - tokyo` (with `-`) so Linux loaded `tokyo`'s actual environment and placed the session in `/home/tokyo`.

### 3. `Permission denied` in `/opt/dev-project` (`755` vs `775`)
- **Problem:** Even though `tokyo` and `berlin` were in the `developers` group, creating files failed because the folder had default `755` (`drwxr-xr-x`) permissions (no group write bit).
- **Solution:** Updated permissions to `775` (`sudo chmod 775 /opt/dev-project`) so the group gained write (`w`) access (`drwxrwxr-x`).

### 4. Wrong `chown` / `chgrp` Syntax & Group Name Typo
- **Problem:** Forgot the `chown` command name / colon prefix (`:developers`), mixed argument order in `chgrp`, and initially typed singular `developer` instead of `developers`.
- **Solution:** Used `sudo chown -R root:developers /opt/dev-project` (or `sudo chgrp developers /opt/dev-project`) and verified exact group names in `/etc/group`.

### 5. `passwd` Command Behavior
- **Problem:** Running `sudo passwd 1234` failed because `passwd` treats the first argument as a username, not a password.
- **Solution:** Explicitly passed the username (`sudo passwd <username>`) for each user.

---

## What I Learned
1. **`useradd -m -s /bin/bash` vs `adduser`:** `useradd` requires `-m` to create a home directory and `-s` to assign `/bin/bash`, followed by `passwd <username>`.
2. **Environment Switching (`su -`):** Always include `-` with `su` when switching users so the target user's home directory and `$PATH` load properly.
3. **Least-Privilege Collaboration via Groups:** Grouping users (`developers`, `admins`, `project-team`) and applying `775` (`rwxrwxr-x`) permissions on shared `/opt` directories enables secure team collaboration without granting `root` access.
4. **Systematic Permission Debugging:** Whenever `Permission denied` occurs, verify three things in order: current directory (`pwd`), user group membership (`groups <user>`), and directory ownership/permissions (`ls -ld`).

---

## Final Result
Day 09 Linux User & Group Management Challenge completed and verified successfully.

- Users created with home directories and passwords
- Groups created and assigned properly
- Shared directories (`/opt/dev-project` & `/opt/team-workspace`) configured with `775` group permissions
- Real permission and user-switching errors diagnosed and resolved

**Day 09 – Completed ✅**

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
