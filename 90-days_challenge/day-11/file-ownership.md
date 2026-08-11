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

Command used:

- ` ```bash` → code block **start**
- `ls -l` → command
- ` ``` ` → code block **close** ✅

Example output:

-rw-r--r-- 1 root root 0 devops-file.txt

Here:

root (first) = file owner
root (second) = group owner
Owner vs Group

Owner:
The user who owns the file or directory. Ownership can be changed using chown.

Group:
A group of users that can receive permissions on the file or directory according to the group permission bits.

Task 2: Basic chown Operations

Created the file:

touch devops-file.txt

Checked ownership:

ls -l devops-file.txt

Initial ownership:

-rw-r--r-- 1 root root 0 devops-file.txt

Changed owner to tokyo:

chown tokyo devops-file.txt

Result:

-rw-r--r-- 1 tokyo root 0 devops-file.txt

Changed owner to berlin:

chown berlin devops-file.txt

Result:

-rw-r--r-- 1 berlin root 0 devops-file.txt
Conclusion

chown is used to change the owner of a file or directory.

Task 3: Basic chgrp Operations

Created:

touch team-notes.txt

Created group:

groupadd heist-team

Changed the group ownership:

chgrp heist-team team-notes.txt

Verified:

ls -l team-notes.txt

Result:

-rw-r--r-- 1 root heist-team 0 team-notes.txt
Conclusion

chgrp is used to change the group ownership of a file or directory.

Task 4: Combined Owner & Group Change

Created:

touch project-config.yaml

Changed both owner and group:

chown professor:heist-team project-config.yaml

Result:

-rw-r--r-- 1 professor heist-team 0 project-config.yaml

Created directory:

mkdir -p app-logs/

Changed owner and group:

chown berlin:heist-team app-logs

Result:

drwxr-xr-x 2 berlin heist-team app-logs
Conclusion

The syntax:

chown user:group file

changes both owner and group at the same time.

Task 5: Recursive Ownership

Created directory structure:

mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf

Created group:

groupadd planners

Applied ownership recursively:

chown -R professor:planners heist-project/

Verified:

ls -lR heist-project/

Result:

heist-project:
drwxr-xr-x 2 professor planners plans
drwxr-xr-x 2 professor planners vault

heist-project/plans:
-rw-r--r-- 1 professor planners strategy.conf

heist-project/vault:
-rw-r--r-- 1 professor planners gold.txt
Conclusion

The -R option performs the ownership change recursively on the directory and everything inside it.

Task 6: Practice Challenge

Created users/groups:

useradd nairobi

groupadd vault-team
groupadd tech-team

Created directory:

mkdir -p bank-heist/

Created files:

touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt

Set different ownership:

chown tokyo:vault-team bank-heist/access-codes.txt

chown berlin:tech-team bank-heist/blueprints.pdf

chown nairobi:vault-team bank-heist/escape-plan.txt

Verified:

ls -l bank-heist/

Result:

-rw-r--r-- 1 tokyo   vault-team access-codes.txt
-rw-r--r-- 1 berlin  tech-team  blueprints.pdf
-rw-r--r-- 1 nairobi vault-team escape-plan.txt
Commands Used
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
Key Commands
Change owner
chown user file
Change group
chgrp group file
Change owner and group
chown user:group file
Recursive ownership change
chown -R user:group directory/
What I Learned
Linux files and directories have an owner and a group owner.
chown changes file ownership, while chgrp changes group ownership.
chown -R can change ownership recursively for an entire directory structure.
Ownership management is important for application deployments, shared directories, logs, CI/CD pipelines and containers.
DevOps Relevance

File ownership is important in real-world DevOps for:

Application deployments
Shared team directories
Web server files
Log files
CI/CD artifacts
Docker and container environments
