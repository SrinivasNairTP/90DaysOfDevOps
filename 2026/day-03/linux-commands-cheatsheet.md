**Linux commands CheatSheet**

### File listing
- `ls -a` — show all files including hidden (dot) files  
- `ls -l` — long format (permissions, owner, size, timestamp)  
- `ls -t` — sort by modification time (newest first)  
- `ls -alt` — combine `-a -l -t` (all, long, sorted by time)

### Create / remove / modify files & directories
- `mkdir <dir>` — create a directory  
- `rmdir <dir>` — remove an empty directory (fails if not empty)  
- `rm <file>` — remove a file  
- `rm -f <file>` — force remove a file (no prompts)  
- `rm -r <dir>` — recursively remove a directory and its contents  
- `rm -rf <dir>` — force recursive remove (no prompts)  
- `touch <file>` — create an empty file or update its timestamp  
- `mv <src> <dst>` — move or rename file/directory  
- `cp -r <src> <dst>` — recursively copy directories (or files)

### View file contents & counts
- `cat <file>` — display file contents  
- `head <file>` — show first 10 lines  
- `head -n 4 <file>` — show first 4 lines  
- `tail <file>` — show last 10 lines  
- `wc <file>` — show line/word/byte counts (use `wc -l` for lines)

Tips: use `man <command>` for full options and examples.
