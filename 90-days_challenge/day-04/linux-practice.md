Day 04 – Linux Practice: Processes and Services

Environment: Ubuntu Linux (practice environment)Focus: Processes, systemd services, logs, and basic troubleshooting

1. Process Checks

1.1 ps

Command:
ps :
Output:
PID TTY          TIME CMD
1666 pts/1    00:00:00 bash
1677 pts/1    00:00:00 ps

What I learned:ps shows processes associated with the current terminal/session.

1.2 ps -ef
Command:

ps -ef
Output (excerpt):

UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 05:57 ?        00:00:01 /sbin/init
root         307       1  0 05:57 ?        00:00:00 /usr/lib/systemd/systemd-journald
root         362       1  0 05:57 ?        00:00:00 /usr/lib/systemd/systemd-udevd
...

What I learned:ps -ef gives a detailed list of running processes, including PID, PPID, user, and command.

1.3 top

Command:
top
Output (excerpt):

Tasks: 125 total,   1 running, 124 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.3 ni, 99.7 id
MiB Mem :   1903.2 total,    867.8 free,    419.6 used
MiB Swap:   1024.0 total,   1024.0 free,      0.0 used.

What I learned:top provides a live view of CPU, memory, load, and running processes.

1.4 pgrep ssh

Command:
pgrep ssh
Output:  898

What I learned:pgrep searches for processes by name/pattern. Here it found the SSH process with PID 898.

Note:I also tried pgrep without a pattern and pgrep pid; those returned no matching process. pgrep needs a search pattern.

2. Service Checks

I selected SSH (ssh.service) as the main service for inspection.

2.1 systemctl status ssh

Command:
systemctl status ssh
Output (excerpt):

● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled)
     Active: active (running)
   Main PID: 898 (sshd)

Aug 07 05:57:28 ubuntu systemd[1]: Started ssh.service - OpenBSD Secure Shell server.
Aug 07 05:57:28 ubuntu sshd[898]: Server listening on 0.0.0.0 port 22.

What I learned:systemctl status <service> shows whether a service is running, its main PID, configuration file, and recent service messages.

2.2 systemctl is-active ssh

Command:
systemctl is-active ssh
Output:
inactive

I had stopped the SSH service during practice, so it correctly reported inactive.

I then started it again:

systemctl start ssh

After starting it:

systemctl is-active ssh
Output:
active

What I learned:systemctl is-active quickly checks whether a service is currently running.

2.3 systemctl enable ssh and systemctl is-enabled ssh

Commands:
systemctl enable ssh
systemctl is-enabled ssh

Output:
Created symlink /etc/systemd/system/multi-user.target.wants/ssh.service → /usr/lib/systemd/system/ssh.service.
enabled

What I learned:enable configures the service to start automatically during boot.

3. Log Checks

3.1 journalctl --since "1 hour ago"

Command:
journalctl --since "1 hour ago"
Output (excerpt):

Aug 07 05:57:24 ubuntu kernel: Linux version 6.8.0-136-generic ...
Aug 07 05:57:24 ubuntu kernel: Hypervisor detected: KVM
...

What I learned:journalctl reads logs collected by the systemd journal. The --since option filters logs by time.

3.2 journalctl --since "1 minute ago"

Command:
journalctl --since "1 minute ago"
Output:

Aug 07 06:14:44 ubuntu PackageKit[2152]: daemon quit
Aug 07 06:14:44 ubuntu systemd[1]: packagekit.service: Deactivated successfully.

What I learned:Time-based filtering is useful when troubleshooting something that happened recently.

3.3 journalctl --since today

Command:
journalctl --since today
Output (excerpt):

Aug 07 05:57:24 ubuntu kernel: Linux version 6.8.0-136-generic ...
Aug 07 05:57:24 ubuntu kernel: KVM detected ...

Note:I also learned that journalctl --since needs an argument. For example:

journalctl --since "1 hour ago"

4. Mini Troubleshooting Flow

Problem: Check whether SSH service is working
Flow:

Check whether SSH is active:

systemctl is-active ssh

If it is inactive, start it:

systemctl start ssh

Check detailed service status:

systemctl status ssh

Check recent logs:

journalctl -u ssh --since "1 hour ago"

Confirm the service is active:

systemctl is-active ssh

Practical result

During practice I stopped SSH, verified that it became inactive, started it again, and verified that it returned to active.

This gave me hands-on practice with the basic identify → investigate → fix → verify troubleshooting flow.

5. Additional Practice

I also checked whether Nginx was installed:

systemctl status nginx

Initially:

Unit nginx.service could not be found.

I then installed Nginx:

sudo apt-get install nginx -y

After installation:

systemctl status nginx

Result:

● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (.../nginx.service; enabled)
     Active: active (running)

This was additional practice and is not required for the main SSH service exercise.

6. Key Commands Practiced

Category

Command

Purpose

Process

ps

Show current terminal processes

Process

ps -ef

Show detailed process list

Process

top

Monitor processes live

Process

pgrep ssh

Find SSH process PID

Service

systemctl status ssh

Inspect SSH service

Service

systemctl is-active ssh

Check active/inactive state

Service

systemctl enable ssh

Enable service at boot

Logs

journalctl --since "1 hour ago"

View recent journal logs

Logs

journalctl --since "1 minute ago"

View very recent logs

Logs

journalctl --since today

View today's journal logs

Troubleshooting

journalctl -u ssh

View SSH-specific logs

7. Interview Takeaway

Q: How do you check a running process in Linux?

Examples:
ps
ps -ef
top
pgrep <process-name>

Q: How do you inspect a systemd service?

systemctl status <service-name>

Q: How do you check service logs?

journalctl -u <service-name>

Q: What is a simple troubleshooting approach?

Identify → Investigate → Fix → Verify
