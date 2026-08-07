Day 05 – Linux Troubleshooting Runbook

Target Service

SSH (ssh.service)

Objective

Quickly check the health of a Linux system, identify running processes, verify a service, and review logs using practical troubleshooting commands.

1. System Health Check

Command

ps

Observation

The command displayed the processes running in the current terminal session.

Command

ps -ef

Observation

The command displayed all running processes with PID, PPID, user, and command information.

2. CPU and Memory Check

Command

top

Observation

CPU idle: approximately 99.7%

Memory available: approximately 1483.6 MiB

Swap available: 1024 MiB

Total tasks: 125

Zombie processes: 0

The system was healthy during the check.

3. Find SSH Process

Command

pgrep ssh

Output

898

Observation

PID 898 was identified for the SSH process.

4. Check SSH Service

Command

systemctl status ssh

Observation

The SSH service was active and running. The SSH server was listening on port 22.

5. Stop and Verify SSH

Command

systemctl stop ssh

Command

systemctl is-active ssh

Output

inactive

Observation

The service became inactive after stopping it. This confirmed that systemctl is-active can be used to check the current service state.

6. Start SSH Again

Commands

systemctl start ssh
systemctl is-active ssh

Observation

The SSH service was started successfully again.

7. Enable SSH at Boot

Command

systemctl enable ssh

Verification

systemctl is-enabled ssh

Output

enabled

Observation

SSH was enabled to start automatically during system boot.

8. Check Nginx Service

Command

systemctl status nginx

Observation

Initially, nginx was not installed. I installed nginx using:

sudo apt-get install nginx -y

After installation, the nginx service became active and running.

9. Review SSH Logs

Command

journalctl -u ssh -n 20

Observation

The SSH logs showed service startup information and successful SSH connections. The logs confirmed that the SSH server started successfully and was listening on port 22.

10. Review Logs by Time

Command

journalctl --since "1 hour ago"

Observation

The command displayed journal entries from the last one hour, including kernel and system startup information.

Command

journalctl --since today

Observation

The command displayed today's journal entries.

Command

journalctl --since "1 minute ago"

Observation

Initially there were no entries. When run again later, recent system events were displayed.

Quick Findings

CPU usage was very low.

Memory and swap were available.

No zombie processes were observed.

SSH was successfully running.

SSH was listening on port 22.

SSH was successfully stopped and started.

SSH was enabled at boot.

SSH logs showed successful connections.

Nginx was successfully installed and started.

journalctl was used to investigate service and time-based logs.

If This Worsens

If the problem becomes worse, I would:

Check CPU, memory and disk usage using top, free -h and df -h.

Check the service status using systemctl status <service>.

Review recent errors using journalctl -u <service> -n 50.

Check network connectivity and listening ports using ip addr show and ss -tulpn.

Restart the affected service if appropriate.

If the issue continues, investigate system and kernel logs using journalctl.

Conclusion

This troubleshooting drill helped me practice a repeatable Linux troubleshooting workflow:

Check → Observe → Investigate Logs → Take Action → Verify

The main commands practiced were:

ps, ps -ef, top, pgrep, systemctl, journalctl, and nginx service management.
