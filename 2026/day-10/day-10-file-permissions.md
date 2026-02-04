# Day 10: File Permissions

## Task 1: Create Files

Create a file using `touch`:
```bash
touch devops.txt
```

Create a file with content using `echo`:
```bash
echo "this is my first file" > notes.txt
cat notes.txt
```

Create `script.sh` with content using `vim`:
```bash
vim script.sh
# Add: echo "Hello DevOps"
```

List files with permissions:
```bash
ls -l
```

## Task 2: Read Files

Read `notes.txt`:
```bash
cat notes.txt
```

View `script.sh` in read-only mode:
```bash
vim -R script.sh
```

Display first 5 lines of `/etc/passwd`:
```bash
head -n 5 /etc/passwd
```

Display last 5 lines of `/etc/passwd`:
```bash
tail -n 5 /etc/passwd
```

## Task 3: Understand Permissions

Check permissions on created files:
```bash
ls -l devops.txt notes.txt script.sh
```

Change `script.sh` to executable (755):
```bash
chmod 755 script.sh
./script.sh
```

## Task 4: Modify Permissions

Set `devops.txt` to read-only:
```bash
chmod 400 devops.txt
```

Create `project/` directory with 755 permissions:
```bash
mkdir project
chmod 755 project
```

Verify changes:
```bash
ls -l
```

## Task 5: Test Permissions

Writing to a read-only file results in: `Permission denied`

Executing a file without execute permission (400):
```bash
chmod 400 script.sh
./script.sh  # Results in: Permission denied
```

