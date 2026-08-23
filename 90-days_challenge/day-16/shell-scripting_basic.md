# Day 16 – Shell Scripting Basics

## 📅 Day 16

**Topic:** Shell Scripting Basics

---

## 🎯 Objectives

Today I practiced the fundamentals of Bash shell scripting:

* Shebang
* Variables
* `echo`
* `read`
* Single quotes vs double quotes
* `if`, `elif`, `else`
* Numeric comparisons
* String comparisons
* File checking with `-f`
* `systemctl`
* `systemctl is-active`
* Command substitution using `$()`
* Debugging Bash syntax errors

---

## 1. Shebang

A shebang tells Linux which interpreter should be used to execute a script.

Example:

```bash
#!/bin/bash
```

This tells the system to execute the script using Bash.

### First Script – `hello.sh`

```bash
#!/bin/bash

echo "Hello, DevOps!"
```

Run:

```bash
chmod +x hello.sh
./hello.sh
```

Output:

```text
Hello, DevOps!
```

### What I learned

`#!/bin/bash` specifies Bash as the interpreter for the script.

---

## 2. Variables

Variables are used to store values.

Example:

```bash
#!/bin/bash

NAME="Praveen"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"
```

Output:

```text
Hello, I am Praveen and I am a DevOps Engineer
```

### Single Quotes vs Double Quotes

Single quotes treat `$VARIABLE` literally:

```bash
echo 'Hello $NAME'
```

Output:

```text
Hello $NAME
```

Double quotes allow variable expansion:

```bash
echo "Hello $NAME"
```

Output:

```text
Hello Praveen
```

### Important

Bash variable names are case-sensitive.

For example:

```bash
$NAME
$name
```

are different variables.

---

## 3. User Input with `read`

I practiced taking input from the user using `read`.

### `greet.sh`

```bash
#!/bin/bash

read -p "Enter your name : " name
read -p "Enter your favourite tool name : " tool

echo "Hello $name, your favourite tool is $tool"
```

Example output:

```text
Enter your name : Praveen Gujjar
Enter your favourite tool name : Linux
Hello Praveen Gujjar, your favourite tool is Linux
```

### What I learned

`read` is used to take input from the user and store it in a variable.

---

# 4. If-Else Conditions

Bash supports conditional statements using:

```bash
if
elif
else
fi
```

Basic structure:

```bash
if [ condition ]; then
    # commands
elif [ condition ]; then
    # commands
else
    # commands
fi
```

---

## 4.1 Number Checking – `check_number.sh`

The script checks whether a number is positive, negative, or zero.

Example logic:

```bash
if [ "$num" -gt 0 ]; then
    echo "Number is positive"
elif [ "$num" -lt 0 ]; then
    echo "Number is negative"
else
    echo "Number is zero"
fi
```

### Tested Cases

```text
10  → Number is positive
-10 → Number is negative
0   → Number is zero
```

### Error I encountered

Initially I used:

```bash
if [ $num -gt 0 ]; do
```

This produced a syntax error.

I learned that `if` uses `then`, not `do`:

```bash
if [ condition ]; then
```

I also tested empty and invalid input and observed errors such as:

```text
unary operator expected
integer expression expected
```

This helped me understand the importance of input validation.

---

# 5. File Checking – `file_check.sh`

I practiced checking whether a regular file exists using `-f`.

Example:

```bash
if [ -f "$filename" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

I tested the script with existing and non-existing files.

Example:

```text
demo.sh → File exists
demo.txt → File does not exist
```

### Important

`-f` checks whether the given path exists and is a regular file.

---

# 6. Combining Concepts – `server_check.sh`

I combined:

* Variables
* `read`
* `if / elif / else`
* String comparison
* `systemctl`
* `systemctl is-active`

The script asks the user for a service name and asks whether they want to check its status.

Example:

```bash
services_name=""

read -p "Enter service name : " services_name

value=""

read -p "Do you want to check the status (y/n) : " value

if [ "$value" = "y" ]; then
    status=$(systemctl is-active "$services_name")

    if [ "$status" = "active" ]; then
        echo "Service $services_name is active"
    else
        echo "Service $services_name is not active"
    fi

elif [ "$value" = "n" ]; then
    echo "Skipped."

else
    echo "Invalid choice"
fi
```

### Example

For SSH:

```text
Enter service name : ssh
Do you want to check the status (y/n) : y
active
```

For skip:

```text
Enter service name : ssh
Do you want to check the status (y/n) : n
Skipped.
```

---

# 🧠 Important Concepts Learned

### Numeric comparison

```bash
-eq    # equal
-ne    # not equal
-gt    # greater than
-lt    # less than
-ge    # greater than or equal
-le    # less than or equal
```

### String comparison

```bash
[ "$value" = "y" ]
```

`-eq` is used for numeric comparison, while `=` can be used for string comparison.

### File test

```bash
[ -f "$filename" ]
```

### Command substitution

```bash
status=$(systemctl is-active "$services_name")
```

`$()` executes a command and allows its output to be stored or used elsewhere.

---

# 🐛 Errors and Debugging

During today's practice I encountered several Bash errors and fixed them.

### 1. Wrong `if` syntax

Wrong:

```bash
if [ $num -gt 0 ]; do
```

Correct:

```bash
if [ $num -gt 0 ]; then
```

### 2. Wrong comparison operator

Wrong:

```bash
if [ "$value" -eq "y" ]; then
```

`-eq` is for numbers.

Correct:

```bash
if [ "$value" = "y" ]; then
```

### 3. Missing space after `echo`

Wrong:

```bash
echo"Skipped."
```

Correct:

```bash
echo "Skipped."
```

### 4. Incorrect command substitution

I learned that `$()` is used for command substitution.

Example:

```bash
status=$(systemctl is-active "$services_name")
```

---

# 📁 Files Created

```text
hello.sh
variables.sh
greet.sh
check_number.sh
file_check.sh
server_check.sh
day-16-shell-scripting.md
```

---

# ✅ Day 16 Completed

Today I practiced the basic building blocks of Bash scripting and learned how to create scripts that take user input, use variables, make decisions, check files, and check Linux service status.

**Next:** Continue with advanced shell scripting concepts and more practical automation.
