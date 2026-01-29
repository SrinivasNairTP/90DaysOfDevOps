# Linux Architecture Notes

## Overview
- Linux is split into kernel space and user space.
- The kernel manages hardware, drivers, memory, processes, and system resources.
- User space contains applications and services that run with restricted privileges.

## Kernel
- The core of the OS responsible for scheduling, memory management, drivers, and system calls.

## init / systemd
- `systemd` is a user-space init system (PID 1) commonly used to control boot, services, logging, and system state.

## Boot flow
BIOS/UEFI -> Boot loader (GRUB, etc.) -> Kernel loads into memory -> Kernel starts `systemd` (PID 1) -> `systemd` starts services -> login prompt / user session

## Processes
- A process is a program in execution.
- Process lifecycle / common states:
    - `created` (new)
    - `ready` (runnable)
    - `running` (CPU scheduled)
    - `sleeping` (waiting/blocking; interruptible or uninterruptible)
    - `stopped` (paused, e.g., by a signal)
    - `zombie` (exited but not reaped by parent)
    - `terminated` (fully exited and cleaned up)

## Monitoring and daily commands
- `ps` — report snapshot of current processes
    - `ps a` — list processes associated with terminals
    - `ps aux` — list all processes with details (user, CPU, memory, start time, command)
- `top` — interactive, real-time view of top CPU/memory consumers
- `htop` — improved interactive viewer (if installed)
- `jobs` — list background jobs in the current shell
- `systemctl start|stop|status <service>` — manage systemd services
- `journalctl -b` — view systemd logs for the current boot
- `grep` — filter command output (e.g., `ps aux | grep <pattern>`)

Notes:
- Use `man <command>` for detailed options (e.g., `man ps`, `man systemctl`).
- Combine commands and filters to find specific processes or troubleshoot services.
- Remember `systemd` logs are accessible via `journalctl`, which is critical for debugging boot and service issues.

