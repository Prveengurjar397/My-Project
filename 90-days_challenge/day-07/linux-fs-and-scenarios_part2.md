Day 07 – Scenario-Based Linux Troubleshooting Practice

Objective

Practice troubleshooting Linux problems step by step instead of guessing commands.

Scenario 1 – Service Not Starting

Problem

A web application service called myapp failed to start after a server reboot.

Step 1: Check Service Status

systemctl status myapp

Why: Shows whether the service is active, failed or stopped.

Step 2: Check Service Logs

journalctl -u myapp -n 50

Why: Shows recent logs that can help identify the reason for failure.

Step 3: Check If Service Is Enabled

systemctl is-enabled myapp

Why: Checks whether the service is configured to start automatically at boot.

Step 4: Check Status 
