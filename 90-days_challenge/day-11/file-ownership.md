# Day 11 – File Ownership Challenge

## Objective

Today I practiced Linux file and directory ownership using:

- `ls -l`
- `chown`
- `chgrp`
- `chown user:group`
- `chown -R`

---

## Task 1: Understanding Ownership

### Command Used

```bash
ls -l
```

### Example Output

```text
-rw-r--r-- 1 root root 0 devops-file.txt
```

### Understanding the Output

In:

```text
-rw-r--r-- 1 root root 0 devops-file.txt
```

- First `root` = File owner
- Second `root` = Group owner

### Owner vs Group

**Owner:**  
The user who owns the file or directory. Ownership can be changed using `chown`.

**Group:**  
A group of users that can receive permissions on the file or directory according to the group permission bits.

---

## Task 2: Basic chown Operations

### Created the File

```bash
touch devops-file.txt
```

### Checked Ownership

```bash
ls -l devops-file.txt
```

### Initial Ownership

```text
-rw-r--r-- 1 root root 0 devops-file.txt
```

### Changed Owner to tokyo

```bash
chown tokyo devops-file.txt
```

### Result

```text
-rw-r--r-- 1 tokyo root 0 devops-file.txt
```

### Changed Owner to berlin

```bash
chown berlin devops-file.txt
```

### Result

```text
-rw-r--r-- 1 berlin root 0 devops-file.txt
```

### Conclusion

`chown` is used to change the owner of a file or directory.

---

## Task 3: Basic chgrp Operations

### Created File

```bash
touch team-notes.txt
```

### Created Group

```bash
groupadd heist-team
```

### Changed Group Ownership

```bash
chgrp heist-team team-notes.txt
```

### Verified

```bash
ls -l team-notes.txt
```

### Result

```text
-rw-r--r-- 1 root heist-team 0 team-notes.txt
```

### Conclusion

`chgrp` is used to change the group ownership of a file or directory.

---

## Task 4: Combined Owner & Group Change

### Created File

```bash
touch project-config.yaml
```

### Changed Both Owner and Group

```bash
chown professor:heist-team project-config.yaml
```

### Result

```text
-rw-r--r-- 1 professor heist-team 0 project-config.yaml
```

### Created Directory

```bash
mkdir -p app-logs/
```

### Changed Owner and Group

```bash
chown berlin:heist-team app-logs
```

### Result

```text
drwxr-xr-x 2 berlin heist-team app-logs
```

### Syntax

```bash
chown user:group file
```

This changes both the owner and group at the same time.

---

## Task 5: Recursive Ownership

### Created Directory Structure

```bash
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
```

### Created Group

```bash
groupadd planners
```

### Applied Ownership Recursively

```bash
chown -R professor:planners heist-project/
```

### Verified

```bash
ls -lR heist-project/
```

### Result

```text
heist-project:
drwxr-xr-x 2 professor planners plans
drwxr-xr-x 2 professor planners vault

heist-project/plans:
-rw-r--r-- 1 professor planners strategy.conf

heist-project/vault:
-rw-r--r-- 1 professor planners gold.txt
```

### Conclusion

The `-R` option performs the ownership change recursively on the directory and everything inside it.

---

## Task 6: Practice Challenge

### Created Users and Groups

```bash
useradd nairobi
groupadd vault-team
groupadd tech-team
```

### Created Directory

```bash
mkdir -p bank-heist/
```

### Created Files

```bash
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
```

### Set Different Ownership

```bash
chown tokyo:vault-team bank-heist/access-codes.txt
chown berlin:tech-team bank-heist/blueprints.pdf
chown nairobi:vault-team bank-heist/escape-plan.txt
```

### Verified

```bash
ls -l bank-heist/
```

### Result

```text
-rw-r--r-- 1 tokyo   vault-team 0 access-codes.txt
-rw-r--r-- 1 berlin  tech-team  0 blueprints.pdf
-rw-r--r-- 1 nairobi vault-team 0 escape-plan.txt
```

---

## Commands Used

```bash
ls -l
touch
useradd
passwd
groupadd
chown
chgrp
mkdir
chown -R
ls -lR
```

---

## Key Commands

### Change Owner

```bash
chown user file
```

### Change Group

```bash
chgrp group file
```

### Change Owner and Group

```bash
chown user:group file
```

### Recursive Ownership Change

```bash
chown -R user:group directory/
```

---

## What I Learned

1. Linux files and directories have an owner and a group owner.
2. `chown` changes file ownership, while `chgrp` changes group ownership.
3. `chown -R` can change ownership recursively for an entire directory structure.

---

## DevOps Relevance

File ownership is important in real-world DevOps for:

- Application deployments
- Shared team directories
- Web server files
- Log files
- CI/CD artifacts
- Docker and container environments

---

## Day 11 Status

**Completed ✅**

I practiced:

- File ownership
- Group ownership
- `chown`
- `chgrp`
- Combined ownership changes
- Recursive ownership changes
- Different ownership for multiple files
