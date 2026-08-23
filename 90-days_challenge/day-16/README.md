Day 16 – Shell Scripting Basics
Task
Start your shell scripting journey — learn the fundamentals every script needs.

You will:

Understand shebang (#!/bin/bash) and why it matters
Work with variables, echo, and read
Write basic if-else conditions
Expected Output
A markdown file: day-16-shell-scripting.md
All scripts you write during the tasks
Challenge Tasks
Task 1: Your First Script
Create a file hello.sh
Add the shebang line #!/bin/bash at the top
Print Hello, DevOps! using echo
Make it executable and run it
chmod +x hello.sh
./hello.sh
Document: What happens if you remove the shebang line?

Task 2: Variables
Create variables.sh with:
A variable for your NAME
A variable for your ROLE (e.g., "DevOps Engineer")
Print: Hello, I am <NAME> and I am a <ROLE>
Try using single quotes vs double quotes — what's the difference?
Task 3: User Input with read
Create greet.sh that:
Asks the user for their name using read
Asks for their favourite tool
Prints: Hello <name>, your favourite tool is <tool>
Task 4: If-Else Conditions
Create check_number.sh that:

Takes a number using read
Prints whether it is positive, negative, or zero
Create file_check.sh that:

Asks for a filename
Checks if the file exists using -f
Prints appropriate message
Task 5: Combine It All
Create server_check.sh that:

Stores a service name in a variable (e.g., nginx, sshd)
Asks the user: "Do you want to check the status? (y/n)"
If y — runs systemctl status <service> and prints whether it's active or not
If n — prints "Skipped."
