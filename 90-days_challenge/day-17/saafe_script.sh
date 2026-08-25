Task 5: Error Handling
1. safe_script.sh
Created a script to practice set -e and the || operator.

Script:

#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test
touch error.sh

Output When Directory Already Exists

mkdir: cannot create directory '/tmp/devops-test': File exists
Directory already exists

Concepts Learned
set -e
Stops the script when an unhandled command fails.

||:
command || echo "Error message"

Runs the command on the right side when the command on the left fails.
