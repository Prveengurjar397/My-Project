Countdown Script

Created countdown.sh to take a number from the user and count down to zero.

#!/bin/bash

read -p "Enter a number : " revers

while [ "$revers" -ge 0 ]; do
    echo "$revers"
    revers=$((revers - 1))
done

echo "Done!"

Example Output 
Enter a number : 5
5
4
3
2
1
0
Done!

**What I learned**
while loop runs while a condition is true.
Arithmetic can be performed using $((...)).
The variable must be decreased inside the loop to avoid an infinite loop.
