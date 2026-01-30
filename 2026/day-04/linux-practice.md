# Process management (Linux) ✅

A concise reference for viewing and managing processes on Linux — commands, examples, and tips.

## View processes

- `ps` — snapshot of processes for the current shell
- `ps -e` — show all processes
- `ps -ef` — full format (UID, PID, PPID, STIME, CMD) — very common
- `ps aux` — BSD style output including CPU and memory usage

Example: `ps -ef | grep nginx` — find nginx processes

## Real-time monitoring

- `top` — interactive view of processes sorted by CPU usage
- `htop` — enhanced interactive viewer (more features and easier navigation)

## Find and kill processes

- `pgrep <name>` — find PID(s) by process name (e.g., `pgrep nginx`)
- `pidof <name>` — return PID(s) of a program
- `kill <PID>` — send SIGTERM (graceful shutdown)
- `kill -9 <PID>` — send SIGKILL (force kill; use only if needed)
- `pkill <name>` or `killall <name>` — kill processes by name

**Tip:** Try `kill <PID>` first to allow cleanup; use `kill -9` only when necessary.

## Background jobs & job control

- Run in background: `command &`
- List shell jobs: `jobs`
- Move job to foreground: `fg %1` (use job number)
- Move job to background: `bg %1`
- Remove job from shell job table: `disown %1`

## Process tree

- `pstree` or `pstree -p` (show PIDs) — view parent/child relationships

---

## Quick reference table

| Task | Command |
| --- | --- |
| See all processes | `ps -ef` |
| Real-time monitoring | `top` / `htop` |
| Find PID | `pgrep <app>` |
| Kill process | `kill <PID>` |
| Force kill | `kill -9 <PID>` |
| Kill by name | `pkill <name>` |
| Background job | `command &` |
| Job control | `jobs`, `fg`, `bg` |
| Process tree | `pstree -p` |

---

## Service management

- `systemctl <command> <service>` — manage systemd services. Common commands: `start`, `stop`, `restart`, `status`, `enable`, `disable`.

  Example: `sudo systemctl restart nginx` — restart the nginx service; `sudo systemctl status nginx` — show service status and summary.

- `journalctl` — view logs from the systemd journal. Useful flags:
  - `journalctl -u <service>` — show logs for a unit (e.g., `journalctl -u nginx`)
  - `journalctl -f` — follow logs (like `tail -f`)
  - `journalctl -u <service> -f` — follow logs for a service
  - `journalctl --since "1 hour ago"` — show recent logs

**Tip:** Use `sudo journalctl -u <service>` or `sudo journalctl -u <service> -f` when diagnosing service issues.