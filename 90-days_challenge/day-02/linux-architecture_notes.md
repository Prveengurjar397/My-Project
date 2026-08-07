# Day 02 – Linux Architecture, Processes and systemd

## 1. Core Components of Linux

### Linux Kernel
- Kernel is the core component of the operating system.
- It manages CPU, memory, processes and hardware devices.
- It provides communication between hardware and software.

### User Space
- User space is where applications and user programs run.
- Applications cannot directly access hardware.
- They communicate with the kernel using system calls.

### init / systemd
- systemd is the first user-space process started by the Linux kernel.
- It normally runs with PID 1.
- It is responsible for starting and managing system services and processes.

## 2. How Applications Access Hardware

Applications running in user space cannot directly access hardware.

They communicate with the Linux kernel through system calls, and the kernel communicates with the hardware.

## 3. How Processes Are Created and Managed

- A process is a running instance of a program.
- When a program starts, the Linux kernel creates a process.
- The kernel assigns the process a unique Process ID (PID).
- It manages CPU, memory and other resources for the process.
- The kernel also schedules processes for execution.

### What is PID?

PID (Process ID) is a unique number assigned by the Linux kernel to a running process.

## 4. Linux Process States

- **Running (R):** The process is running or ready to run.
- **Sleeping (S):** The process is waiting for an event or resource.
- **Stopped (T):** The process has been temporarily stopped.
- **Zombie (Z):** The process has finished, but its parent has not yet collected its exit status.

## 5. What is systemd?

systemd is a system and service manager used by many modern Linux distributions.

It normally runs as PID 1 and is responsible for:

- Starting services during boot
- Managing services
- Handling service dependencies
- Monitoring processes
- Managing the system startup process

### Why systemd matters in DevOps

systemd helps DevOps engineers start, stop, restart and troubleshoot services.

## 6. 5 Daily Linux Commands

| Command      | Purpose                           |
|--------------|-----------------------------------|
| `ps`         | View running processes            |
| `top`        | Monitor CPU, memory and processes |
| `systemctl`  | Manage systemd services           |
| `journalctl` | View system and service logs      |
| `kill`       | Send a signal to a process        |

## Key Takeaway

Linux architecture is based on the interaction between user space, the kernel and system services. Understanding processes and systemd is important for troubleshooting and managing production Linux servers.
