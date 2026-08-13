Day 11 – File Ownership Challenge

Objective

Today I practiced Linux file and directory ownership using:

ls -l

chown

chgrp

chown user:group

chown -R

Task 1: Understanding Ownership

Command Used

ls -l

Example Output

-rw-r--r-- 1 root root 0 devops-file.txt

Understanding the Output

First root = File owner

Second root = Group owner

Owner vs Group

Owner:
The user who owns the file or directory. Ownership can be changed using chown.

Group:
A group of users that can receive permissions on the file or directory according to the group permission bits.

Task 2: Basic chown Operations

Create the File

touch devops-file.txt

Check Current Ownership

ls -l devops-file.txt

Initial Ownership

-rw-r--r-- 1 root root 0 devops-file.txt

Change Owner to tokyo

chown tokyo devops-file.txt

Result

-rw-r--r-- 1 tokyo root 0 devops-file.txt

Change Owner to berlin

chown berlin devops-file.txt

Result

-rw-r--r-- 1 berlin root 0 devops-file.txt

Conclusion

chown is used to change the owner of a file or directory.

Task 3: Basic chgrp Operations

Create File

touch team-notes.txt

Create Group

groupadd heist-team

Change Group Ownership

chgrp heist-team team-notes.txt

Verify

ls -l team-notes.txt

Result

-rw-r--r-- 1 root heist-team 0 team-notes.txt

Conclusion

chgrp is used to change the group ownership of a file or directory.

Task 4: Combined Owner & Group Change

Create File

touch project-config.yaml

Change Owner and Group

chown professor:heist-team project-config.yaml

Result

-rw-r--r-- 1 professor heist-team 0 project-config.yaml

Create Directory

mkdir -p app-logs/

Change Owner and Group

chown berlin:heist-team app-logs

Result

drwxr-xr-x 2 berlin heist-team app-logs

Conclusion

The syntax:

chown user:group file

changes both the owner and group at the same time.

Task 5: Recursive Ownership

Create Directory Structure

mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf

Create Group

groupadd planners

Apply Ownership Recursively

chown -R professor:planners heist-project/

Verify

ls -lR heist-project/

Result

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

Create User

useradd nairobi

Create Groups

groupadd vault-team
groupadd tech-team

Create Directory

mkdir -p bank-heist/

Create Files

touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt

Set Different Ownership

Access Codes:

chown tokyo:vault-team bank-heist/access-codes.txt

Blueprints:

chown berlin:tech-team bank-heist/blueprints.pdf

Escape Plan:

chown nairobi:vault-team bank-heist/escape-plan.txt

Verify Ownership

ls -l bank-heist/

Result

-rw-r--r-- 1 tokyo   vault-team 0 access-codes.txt
-rw-r--r-- 1 berlin  tech-team  0 blueprints.pdf
-rw-r--r-- 1 nairobi vault-team 0 escape-plan.txt

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

Change Owner

chown user file

Change Group

chgrp group file

Change Owner and Group

chown user:group file

Recursive Ownership Change

chown -R user:group directory/

What I Learned

Linux files and directories have an owner and a group owner.

chown changes file ownership, while chgrp changes group ownership.

chown -R can change ownership recursively for an entire directory structure.

DevOps Relevance

File ownership is important in real-world DevOps for:

Application deployments

Shared team directories

Web server files

Log file management

CI/CD artifacts

Docker and container environments
