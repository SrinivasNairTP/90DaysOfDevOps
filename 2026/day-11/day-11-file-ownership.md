# File Ownership in Linux

## Task 1: Understanding Ownership

When you run `ls -l`, files and directories are listed with permissions for Owner, Group, and Others.

**Key Concepts:**
- **Owner**: An individual user who owns the file
- **Group**: A set of users with shared access permissions
- Each has separate permission sets

Example: Owner `ubuntu`, Group `ubuntu`

## Task 2: Basic chown Operations

Change file ownership using `chown`:

```bash
chown tokyo devops.txt
ls -l devops.txt
chown berlin devops.txt
ls -l devops.txt
```

## Task 3: Basic chgrp Operations

Change group ownership using `chgrp`:

```bash
touch team-notes.txt
sudo groupadd heist-team
sudo chgrp heist-team team-notes.txt
ls -l team-notes.txt
```

## Task 4: Combined Owner & Group Change

Change both owner and group simultaneously:

```bash
touch project-config.yaml
sudo chown professor:heist-team project-config.yaml

mkdir app-logs
sudo chown berlin:heist-team app-logs
```

## Task 5: Recursive Ownership

Change ownership recursively for directories:

```bash
mkdir -p heist-project/{vault,plans}
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf

sudo groupadd planners
sudo chown -R professor:planners heist-project
ls -lR heist-project
```

## Task 6: Practice Challenge

```bash
sudo addgroup vault-team
sudo addgroup tech-team

mkdir bank-heist
touch bank-heist/{access-codes.txt,blueprints.pdf,escape-plan.txt}

sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt

ls -l bank-heist/
```