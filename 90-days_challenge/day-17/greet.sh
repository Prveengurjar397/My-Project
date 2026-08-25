Task 3: Command-Line Arguments


 **greet.sh**

Created a script that accepts a name as the first command-line argument.

Script:

#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <name>"
else
    echo "Hello, $1!"
fi

**Output Without Argument
$ ./greet.sh
Usage: ./greet.sh <name>


**Output With Argument**
$ ./greet.sh praveen
Hello, praveen!
Concepts Learned
$0 → Script name
$1 → First argument
-z → Checks whether a string is empty
