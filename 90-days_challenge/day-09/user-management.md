# Day 09 – Linux User & Group Management Challenge

## Task

Today I practiced Linux user and group management by creating users, groups, assigning group memberships, and setting up shared directories with group permissions.

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

## Task 1 – Create Users

Created the following users:

- `tokyo`
- `berlin`
- `professor`
- `nairobi`

Verified users using:

```bash
cat /etc/passwd
ls /home
```

User home directories were created for the users created with the `-m` option.

---

## Task 2 – Create Groups

Created the following groups:

```bash
groupadd developers
groupadd admins
groupadd project-team
```

Verified groups using:

```bash
cat /etc/group
```

---

## Task 3 – Assign Users to Groups

### Group Assignments

| User | Groups |
|---|---|
| tokyo | developers, project-team |
| berlin | developers, admins |
| professor | admins |
| nairobi | project-team |

Commands used:

```bash
usermod -aG developers tokyo
usermod -aG developers berlin
usermod -aG admins berlin
usermod -aG admins professor
usermod -aG project-team nairobi
usermod -aG project-team tokyo
```

Verified group membership using:

```bash
id tokyo
id berlin
id professor
id nairobi
```

---

## Task 4 – Shared Directory

Created the shared directory:

```bash
mkdir -p /opt/dev-project
```

Changed the group ownership to `developers`:

```bash
chgrp developers /opt/dev-project
```

Set permissions to `775`:

```bash
chmod 775 /opt/dev-project
```

Verified permissions:

```bash
ls -ld /opt/dev-project
```

Expected:

```text
drwxrwxr-x root developers /opt/dev-project
```

### File Creation Test

Created files as different users:

```bash
sudo -u tokyo touch /opt/dev-project/tokyo.txt
sudo -u berlin touch /opt/dev-project/berlin.txt
```

Verified:

```bash
ls -l /opt/dev-project
```

Both users were able to create files in the shared directory.

---

## Task 5 – Team Workspace

Created the team workspace:

```bash
mkdir -p /opt/team-workspace
```

Created the group:

```bash
groupadd project-team
```

Added users to the group:

```bash
usermod -aG project-team nairobi
usermod -aG project-team tokyo
```

Changed group ownership:

```bash
chgrp project-team /opt/team-workspace
```

Set permissions:

```bash
chmod 775 /opt/team-workspace
```

### Test File Creation

Created a file as `nairobi`:

```bash
sudo -u nairobi touch /opt/team-workspace/nairobi.txt
```

Verified:

```bash
ls -la /opt/team-workspace
```

Output confirmed:

```text
drwxrwxr-x root project-team /opt/team-workspace
-rw-rw-r-- nairobi nairobi nairobi.txt
```

---

## Commands Practiced

```bash
useradd
useradd -m
passwd
groupadd
usermod -aG
id
cat /etc/passwd
cat /etc/group
ls /home
mkdir -p
chgrp
chmod
sudo -u
ls -l
ls -ld
```

---

## What I Learned

1. `useradd -m` creates a user along with its home directory.
2. `usermod -aG` adds a user to a supplementary group.
3. `chgrp` changes the group ownership of a file or directory.
4. `chmod 775` gives read, write, and execute permissions to the owner and group, and read and execute permissions to others.
5. `sudo -u username command` can be used to test a command as another user.
6. Linux groups are useful for managing shared access to directories and files.

---

## Troubleshooting & Mistakes I Fixed

### Wrong group name

I initially used:

```bash
usermod -aG developer tokyo
```

The group was actually named:

```text
developers
```

Correct command:

```bash
usermod -aG developers tokyo
```

### Wrong `chgrp` syntax

I initially used the arguments in the wrong order.

Correct syntax:

```bash
chgrp developers /opt/dev-project
```

### Testing another user

Instead of trying to execute a text file with `sudo -u`, I used:

```bash
sudo -u tokyo touch /opt/dev-project/tokyo.txt
sudo -u berlin touch /opt/dev-project/berlin.txt
```

This successfully verified file creation permissions.

---

## Final Result

Day 09 Linux User & Group Management Challenge completed successfully.

- Users created and verified
- Groups created and verified
- Group memberships configured
- Shared directory configured
- Permissions configured
- File creation tested with different users
- Team workspace configured and tested

**Day 09 – Completed ✅**

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham
