# 📋 DevOps Month 1 Cheat Sheet
**Author:** Ositadilima Nwabuisi  
**GitHub:** github.com/ositadilimanwabuisi  
**Purpose:** Quick reference for Month 1 DevOps fundamentals

---

## 🐧 Linux Navigation

```bash
pwd                  # Show current directory
ls                   # List files
ls -l                # List files with details
ls -la               # List all files including hidden
cd foldername        # Go into a folder
cd ..                # Go back one level
cd ~                 # Go to home folder
cd /                 # Go to root (main gate)
clear                # Clear the terminal screen
```

---

## 📁 File & Folder Management

```bash
mkdir foldername          # Create a new folder
touch filename.txt        # Create an empty file
cat filename.txt          # Read a file
cp file.txt backup.txt    # Copy a file
mv file.txt newname.txt   # Move or rename a file
rm filename.txt           # Delete a file
rm -rf foldername         # Delete folder + everything inside (CAREFUL!)
nano filename.txt         # Open file in text editor
```

---

## 🔐 File Permissions

```bash
ls -l                     # View file permissions
chmod 777 file.txt        # Everyone full access
chmod 755 file.txt        # Owner full, others read+execute
chmod 644 file.txt        # Owner read+write, others read
chmod 700 file.txt        # Owner full, others nothing
chmod 600 file.txt        # Owner read+write only (SSH keys!)
chmod +x script.sh        # Make file executable
```

### Permission Numbers:
| Number | Permission | Meaning |
|--------|-----------|---------|
| 4 | r | Read |
| 2 | w | Write |
| 1 | x | Execute |
| 7 | rwx | Full access |
| 6 | rw- | Read + Write |
| 5 | r-x | Read + Execute |
| 4 | r-- | Read only |
| 0 | --- | No access |

### Permission String Breakdown:
```
-  rwx  r-x  r--
│   │    │    │
│   │    │    └── Everyone else
│   │    └─────── Group
│   └──────────── Owner
└──────────────── File type (- = file, d = directory)
```

---

## 👥 Users & Groups

```bash
sudo adduser john                    # Create new user (full setup)
sudo deluser john                    # Delete a user
sudo groupadd developers             # Create a new group
sudo usermod -aG developers john     # Add user to group
sudo gpasswd -d john developers      # Remove user from group
groups john                          # See user's groups
whoami                               # See current user
cat /etc/passwd                      # List all users
cat /etc/group                       # List all groups
su john                              # Switch to another user
sudo command                         # Run command as root
exit                                 # Leave current session
```

---

## ⚙️ Processes & Services

```bash
ps aux                    # Show all running processes
ps aux | grep nginx       # Find specific process
top                       # Live process monitor
htop                      # Pretty live process monitor
kill PID                  # Politely stop a process
kill -9 PID               # Force kill a process
Ctrl+C                    # Cancel running command

# Service Management
sudo systemctl start nginx      # Start a service
sudo systemctl stop nginx       # Stop a service NOW
sudo systemctl restart nginx    # Stop then start
sudo systemctl status nginx     # Check if running
sudo systemctl enable nginx     # Auto-start on boot
sudo systemctl disable nginx    # Don't auto-start on boot
```

---

## 📦 Package Management (apt)

```bash
sudo apt update               # Refresh package catalogue
sudo apt upgrade -y           # Upgrade all installed packages
sudo apt install nginx -y     # Install a package
sudo apt remove nginx         # Remove a package
sudo apt purge nginx          # Remove + delete config files
apt search curl               # Search for a package
apt show curl                 # See package details
sudo apt autoremove           # Clean unused packages
sudo apt update && sudo apt upgrade -y   # Update then upgrade
```

---

## 🔑 SSH (Secure Shell)

```bash
# Generate SSH key pair
ssh-keygen -t ed25519 -C "your-label"

# Key files location
~/.ssh/id_ed25519        # Private key (NEVER share!)
~/.ssh/id_ed25519.pub    # Public key (safe to share)

# Connect to remote server
ssh username@server-address
ssh osita@192.168.1.100
ssh osita@myserver.com

# Connect with specific key
ssh -i ~/.ssh/id_ed25519 osita@server-address

# Copy public key to server
ssh-copy-id osita@server-address

# Exit SSH session
exit
```

### SSH Key Permissions (IMPORTANT!):
```bash
chmod 600 ~/.ssh/id_ed25519      # Private key must be 600
chmod 644 ~/.ssh/id_ed25519.pub  # Public key is 644
```

---

## 🗂️ Git Commands

```bash
# Setup
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
git config --list                    # Check configuration

# Starting a repo
git init                             # Initialize new repo
git clone https://github.com/...     # Download existing repo

# Daily workflow
git status                           # Check current state
git add filename.txt                 # Stage specific file
git add .                            # Stage ALL changes
git commit -m "Your message here"    # Save snapshot
git log                              # Full commit history
git log --oneline                    # Clean one-line history

# Branching
git branch                           # List all branches
git branch feature-test              # Create new branch
git checkout feature-test            # Switch to branch
git checkout -b feature-test         # Create AND switch (one command)
git merge feature-test               # Merge branch into current
git branch -d feature-test           # Delete merged branch

# GitHub
git remote add origin https://github.com/username/repo.git
git remote -v                        # Check remote connection
git push origin main                 # Push to GitHub
git pull origin main                 # Pull from GitHub
```

---

## 🔧 Bash Scripting

```bash
#!/bin/bash              # Shebang - always first line
# This is a comment     # Comments start with #

# Variables (NO spaces around =)
NAME="Osita"
COMPANY="TPPCNG"
echo "Hello $NAME"      # Use $ to access variable
echo "Today: $(date)"   # Run command inside $()

# If statement
if [ $USAGE -gt 80 ]; then
    echo "Too high!"
elif [ $USAGE -gt 60 ]; then
    echo "Getting high"
else
    echo "All good!"
fi

# FOR loop
for SERVER in server1 server2 server3; do
    echo "Checking $SERVER"
done

# WHILE loop
COUNT=5
while [ $COUNT -gt 0 ]; do
    echo "$COUNT remaining"
    COUNT=$((COUNT - 1))
done

# Check last command success
if [ $? -eq 0 ]; then
    echo "Success!"
else
    echo "Failed!"
fi

# Make script executable
chmod +x script.sh

# Run script
./script.sh
```

### Useful Conditions:
| Condition | Meaning |
|-----------|---------|
| `-eq` | Equal to |
| `-gt` | Greater than |
| `-lt` | Less than |
| `-f "file"` | File exists |
| `-d "folder"` | Directory exists |
| `!` | NOT (reverse condition) |

---

## 🐍 Python Basics for DevOps

```python
#!/usr/bin/env python3

# Variables
name = "Osita"
count = 0

# Print
print("Hello DevOps!")
print(f"My name is {name}")   # f-string

# If statement
if count > 80:
    print("Too high!")
elif count > 60:
    print("Getting high")
else:
    print("All good!")

# FOR loop
servers = ["server1", "server2", "server3"]
for server in servers:
    print(f"Checking {server}")

# Read a file
with open("logfile.txt", "r") as file:
    for line in file:
        line = line.strip()
        if "ERROR" in line:
            print(f"Found error: {line}")

# Count occurrences
error_count = 0
warning_count = 0

with open("logfile.txt", "r") as file:
    for line in file:
        if "ERROR" in line:
            error_count += 1
        elif "WARNING" in line:
            warning_count += 1

print(f"Errors: {error_count}")
print(f"Warnings: {warning_count}")
```

---

## 🚀 Complete Git Push Workflow

```bash
# Every time you want to save and push work:
git add .
git commit -m "Describe what you changed"
git push origin main
```

---

## 💼 Key Concepts To Remember

| Concept | One Line Summary |
|---------|-----------------|
| Root `/` | Main gate — top of Linux filesystem |
| Home `~` | Your personal folder `/home/osita` |
| sudo | Borrow root power for ONE command |
| chmod 600 | Private key permission — most secure |
| PID | Process ID — unique number for every running program |
| HEAD | Git's "You Are Here" marker |
| origin | Nickname for your GitHub remote repo |
| Shebang `#!/bin/bash` | Tells Linux which interpreter to use |
| `$?` | Exit status of last command (0=success) |
| Cron | Linux job scheduler for automatic tasks |

---

*Last updated: July 2026 | Month 1 Complete ✅*
