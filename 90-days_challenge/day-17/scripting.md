# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Overview

Today I practiced Shell Scripting concepts including:

- For loops
- While loops
- Command-line arguments
- Package installation using scripts
- Error handling using `set -e` and `||`
- Root user checking using `$EUID`

---

# Task 1: For Loop

## 1. For Loop – Fruits

Created a script to loop through a list of fruits and print each fruit.

### Concept

```bash
for i in list; do
    echo "$i"
done
```
What I learned

A for loop is used to repeat a command for each item in a list.
