Day 11 – File Ownership Challenge (chown & chgrp)
Task
Master file and directory ownership in Linux.

Understand file ownership (user and group)
Change file owner using chown
Change file group using chgrp
Apply ownership changes recursively
Expected Output
A markdown file: day-11-file-ownership.md
Screenshots showing ownership changes
Challenge Tasks
Task 1: Understanding Ownership (10 minutes)
Run ls -l in your home directory
Identify the owner and group columns
Check who owns your files
Format: -rw-r--r-- 1 owner group size date filename

Document: What's the difference between owner and group?

Task 2: Basic chown Operations (20 minutes)
Create file devops-file.txt
Check current owner: ls -l devops-file.txt
Change owner to tokyo (create user if needed)
Change owner to berlin
Verify the changes
Try:

sudo chown tokyo devops-file.txt
Task 3: Basic chgrp Operations (15 minutes)
Create file team-notes.txt
Check current group: ls -l team-notes.txt
Create group: sudo groupadd heist-team
Change file group to heist-team
Verify the change
Task 4: Combined Owner & Group Change (15 minutes)
Using chown you can change both owner and group together:

Create file project-config.yaml
Change owner to professor AND group to heist-team (one command)
Create directory app-logs/
Change its owner to berlin and group to heist-team
Syntax: sudo chown owner:group filename

Task 5: Recursive Ownership (20 minutes)
Create directory structure:

mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
Create group planners: sudo groupadd planners

Change ownership of entire heist-project/ directory:

Owner: professor
Group: planners
Use recursive flag (-R)
Verify all files and subdirectories changed: ls -lR heist-project/

Task 6: Practice Challenge (20 minutes)
Create users: tokyo, berlin, nairobi (if not already created)

Create groups: vault-team, tech-team

Create directory: bank-heist/

Create 3 files inside:

touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
Set different ownership:

access-codes.txt → owner: tokyo, group: vault-team
blueprints.pdf → owner: berlin, group: tech-team
escape-plan.txt → owner: nairobi, group: vault-team
Verify: ls -l bank-heist/
