Created a script to practice command-line arguments.

Script :

#!/bin/bash

echo "Total arguments are : $#"
echo "All arguments are : $@"
echo "Script name is : $0"

**Example**
./args_demo.sh praveen my name is praveen gujjar

Output-:

Total arguments are : 6
All arguments are : praveen my name is praveen gujjar
Script name is : ./args_demo.sh

**Important Variables**

Variable	Meaning
$0       	Script name
$1	      First argument
$#	      Total number of arguments
$@	      All arguments
