# Day 12 – Breather & Revision

## Goal

Today I revised the important concepts I learned during Days 01–11.

My main focus was Linux fundamentals, processes and services, logs, file permissions, ownership, users and groups.

---

## 1. Mindset & Plan Review

### My Current Goal

My goal is to become a **DevOps / SRE Engineer** with strong Linux, troubleshooting and automation skills.

### My Core Skills

1. Linux & System Administration
2. Automation
3. SRE / DevOps Engineering

### What I Want to Improve

- Become more confident with Linux
- Improve troubleshooting skills
- Understand system and service logs better
- Build basic Shell Scripting skills
- Gain more practical experience
- Continue moving toward my SRE/DevOps career goal

---

# 2. Processes & Services Revision

## Process Check

Command used:

```bash
ps
```

I used `ps` to check the currently running processes in my shell/session.

Example output:

```text
PID TTY          TIME CMD
1812 pts/1    00:00:00 bash
1888 pts/1    00:00:00 ps
```

### What I Learned

`ps` helps me inspect running processes and their process IDs.

---

## System Health Check

Command used:

```bash
systemctl status
```

The system showed:

```text
State: running
Units: 422 loaded
Jobs: 0 queued
Failed: 0 units
```

This indicated that the system was running and no failed systemd units were reported at that time.

---

## SSH Service Check

Command used:

```bash
systemctl status ssh
```

The SSH service showed:

```text
Active: active (running)
```

### Commands I Can Use

Check whether a service is currently active:

```bash
systemctl is-active ssh
```

Check whether a service is enabled:

```bash
systemctl is-enabled ssh
```

View detailed service information:

```bash
systemctl status ssh
```

Check related processes:

```bash
ps
```

---

# 3. Logs Revision

Command used:

```bash
journalctl -u ssh
```

This displayed logs related to the SSH service.

I observed different events such as:

- SSH service starting
- SSH service stopping
- SSH connections being accepted
- Systemd service events
- Previous boot logs

### My Current Understanding

I understand how to view service logs using `journalctl`.

However, I still need more practice with:

- Reading logs efficiently
- Finding the exact time of an event
- Identifying the important error message
- Troubleshooting problems using logs
- Filtering logs for a particular time or event

This is one of the areas I want to improve during the next few days.

---

# 4. File Skills Revision

## Create and Modify File

Command used:

```bash
echo "Revision" >> revision.txt
```

Check file:

```bash
ls -l revision.txt
```

Initial permission:

```text
-rw-r--r-- 1 root root 9 revision.txt
```

Changed permission:

```bash
sudo chmod 640 revision.txt
```

Result:

```text
-rw-r----- 1 root root 9 revision.txt
```

### What I Learned

`chmod 640` gives:

- Owner → read + write
- Group → read
- Others → no permissions

---

# 5. User & Ownership Revision

Changed the owner of the file:

```bash
sudo chown tokyo revision.txt
```

Verified:

```bash
ls -l revision.txt
```

Result:

```text
-rw-r----- 1 tokyo root 9 revision.txt
```

Checked the user:

```bash
id tokyo
```

Result:

```text
uid=1001(tokyo) gid=1001(tokyo) groups=1001(tokyo)
```

### What I Learned

`chown` can be used to change file ownership.

For changing both owner and group:

```bash
chown user:group file
```

Example:

```bash
sudo chown tokyo:devops revision.txt
```

---

# 6. Mini Self-Check

## Q1. Which 3 commands save you the most time right now, and why?

### 1. `systemctl status`

It helps me quickly check the status and details of a service.

### 2. `journalctl`

It helps me view service/system logs and investigate problems.

### 3. `ls -l`

It helps me understand file permissions, ownership and groups.

---

## Q2. How do you check if a service is healthy?

First, I can check whether the service is active:

```bash
systemctl is-active ssh
```

For detailed information:

```bash
systemctl status ssh
```

I can also check the processes related to the service:

```bash
ps
```

`systemctl is-enabled` can be used when I specifically want to check whether a service is enabled to start automatically.

---

## Q3. How do you safely change ownership and permissions without breaking access?

First, I should check the current ownership and permissions:

```bash
ls -l filename
```

Then make the required change carefully.

Example:

```bash
sudo chown tokyo:devops revision.txt
```

And verify:

```bash
ls -l revision.txt
```

For permissions:

```bash
sudo chmod 640 revision.txt
```

Then verify again using:

```bash
ls -l revision.txt
```

---

## Q4. What will you focus on improving in the next 3 days?

During the next 3 days, I will focus on:

1. Becoming more confident with Linux.
2. Improving troubleshooting skills.
3. Understanding logs and identifying problems from them.
4. Learning the basics of Shell Scripting.
5. Improving my practical skills.
6. Taking another step toward my SRE/DevOps career goal.

---

# 7. Key Takeaways

- `ps` helps me inspect running processes.
- `systemctl status` provides detailed service information.
- `systemctl is-active` checks whether a service is currently active.
- `systemctl is-enabled` checks whether a service is enabled.
- `journalctl -u <service>` shows logs for a specific service.
- `ls -l` shows file permissions, owner and group.
- `chmod` changes file permissions.
- `chown` changes file ownership.
- `id` shows user and group information.

---

# 8. What I Need More Practice With

My main weak area right now is **log analysis and troubleshooting**.

I can view logs using `journalctl`, but I need more practice understanding:

- Which log entry is important
- How to find a specific time
- How to identify errors
- How to connect an error with the actual problem
- How to use logs during troubleshooting

I will improve this through more hands-on practice.

---

# 9. Day 12 Summary

Day 12 was a revision day.

I revised processes, services, logs, file permissions, users, groups and ownership.

I also identified the areas where I need more practice, especially log analysis, troubleshooting and Shell Scripting.

My focus is to keep building practical Linux skills and move step-by-step toward becoming a **SRE / DevOps Engineer**.
