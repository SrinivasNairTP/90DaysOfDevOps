# User and Group Management Practice

## Task 1: Create User Home Directories

Create users with home directories:

```bash
useradd -m berlin
useradd -m tokyo
useradd -m professor
useradd -m nairobi
```

Verify users were created:

```bash
cat /etc/passwd
```

## Task 2: Create User Groups

Create two groups:

```bash
sudo groupadd developers
sudo groupadd admins
```

Verify groups were created:

```bash
cat /etc/group
```

## Task 3: Assign Users to Groups

Add tokyo to developers:

```bash
sudo usermod -aG developers tokyo
```

Add berlin to developers and admins:

```bash
sudo usermod -aG developers,admins berlin
```

Add professor to admins:

```bash
sudo usermod -aG admins professor
```

Verify group assignments:

```bash
cat /etc/group
```

## Task 4: Create Shared Directory

Create and configure `/opt/dev-project`:

```bash
mkdir /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project
```

Create files as users:

```bash
sudo -u tokyo touch /opt/dev-project/tokyofile.txt
sudo -u berlin touch /opt/dev-project/berlinfile.txt
```

## Task 5: Team Workspace

Create group and add users:

```bash
sudo groupadd project-team
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```

Create and configure workspace directory:

```bash
mkdir /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
```

Test by creating a file as nairobi:

```bash
sudo -u nairobi touch /opt/team-workspace/nairobi.txt
```