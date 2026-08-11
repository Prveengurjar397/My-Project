# Day 10 – File Permissions & File Operations Challenge

## Task

Today I practiced basic Linux file operations and file permissions using `touch`, `cat`, `vim`, `head`, `tail`, `chmod`, and directory permissions.

---

## Files Created

The following files and directory were created:

- `devops.txt`
- `notes.txt`
- `script.sh`
- `project/`

### Verification

```bash
ls -l
```

---

## Task 1 – Create Files

### Create `devops.txt`

Created an empty file using:

```bash
touch devops.txt
```

### Create `notes.txt`

Created and wrote content using:

```bash
touch notes.txt
echo " hello" > notes.txt
```

Verified using:

```bash
cat notes.txt
```

### Create `script.sh`

Created the script using Vim:

```bash
vim script.sh
```

The script was later corrected and tested successfully.

Final script output:

```text
hello devops
Hello DevOps
aapka swagat h devops jaurny me
```

---

## Task 2 – Read Files

### Read `notes.txt`

```bash
cat notes.txt
```

### View `script.sh`

```bash
vim script.sh
```

### Display first 5 lines of `/etc/passwd`

```bash
head -n 5 /etc/passwd
```

### Display last 5 lines of `/etc/passwd`

```bash
tail -n 5 /etc/passwd
```

---

## Task 3 – Understanding Permissions

Linux file permissions follow this format:

```text
rwxrwxrwx
```

Where:

```text
r = read    = 4
w = write   = 2
x = execute = 1
```

The three permission groups are:

```text
Owner | Group | Others
```

### Permission examples

```text
644 = rw-r--r--
640 = rw-r-----
744 = rwxr--r--
755 = rwxr-xr-x
```

---

## Task 4 – Modify Permissions

### `devops.txt`

Initially the file had normal permissions.

Changed it to read-only:

```bash
chmod 400 devops.txt
```

Verified:

```bash
ls -l devops.txt
```

Result:

```text
-r-------- 1 root root 0 devops.txt
```

The owner has read permission and write/execute permissions are removed.

---

### `notes.txt`

Changed permissions to `640`:

```bash
chmod 640 notes.txt
```

Verified:

```bash
ls -l notes.txt
```

Result:

```text
-rw-r----- 1 root root notes.txt
```

Meaning:

```text
Owner  → read + write
Group  → read
Others → no permission
```

---

### `script.sh`

Initially the script did not have execute permission.

Trying to execute it:

```bash
./script.sh
```

Result:

```text
Permission denied
```

Added execute permission:

```bash
chmod 744 script.sh
```

Then executed:

```bash
./script.sh
```

The script executed successfully.

---

### `project/` Directory

Created the directory:

```bash
mkdir -p project
```

Set permissions to `755`:

```bash
chmod 755 project
```

Verified:

```bash
ls -ld project
```

Result:

```text
drwxr-xr-x 2 root root project
```

---

## Task 5 – Test Permissions

### Test 1 – Execute Without Execute Permission

Removed execute permission:

```bash
chmod 644 script.sh
```

Then tried:

```bash
./script.sh
```

Result:

```text
Permission denied
```

This showed that a file cannot be directly executed using `./script.sh` without execute (`x`) permission.

Execute permission was restored:

```bash
chmod +x script.sh
```

---

### Test 2 – Read-Only File

A read-only file was tested by removing write permission.

The purpose was to understand how Linux prevents normal users from modifying files without write permission.

---

## Important Concept – Running a Script Without `x`

A shell script can sometimes be run without its own execute permission by explicitly passing it to the shell:

```bash
bash script.sh
```

This is different from:

```bash
./script.sh
```

`./script.sh` requires execute permission on the script.

---

## Commands Used

```bash
touch
cat
echo
vim
head
tail
ls
chmod
mkdir
./script.sh
bash script.sh
```

---

## Permission Commands Practiced

```bash
chmod 400 devops.txt
chmod 640 notes.txt
chmod 744 script.sh
chmod 755 project
chmod +x script.sh
chmod 644 script.sh
```

---

## What I Learned

1. Linux uses `r`, `w`, and `x` permissions for files and directories.
2. `chmod` is used to modify file and directory permissions.
3. A script needs execute permission to run directly using `./script.sh`.
4. `cat` can read a file when the user has read permission.
5. `bash script.sh` can execute a readable shell script without giving the script itself execute permission.
6. Numeric permissions such as `640`, `744`, and `755` represent different combinations of read, write, and execute permissions.

---

## Final Result

Day 10 – File Permissions & File Operations Challenge completed successfully.

- Files created ✅
- Files read using `cat` ✅
- `head` and `tail` practiced ✅
- File permissions modified using `chmod` ✅
- Script execution tested ✅
- Permission errors tested ✅
- Directory permission `755` configured ✅

**Day 10 – Completed ✅**

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham
