#!/bin/bash
# Directory Backup Script
# Written by Ositadilima Nwabuisi
# Purpose: Backup devops lab files automatically

# Variables
SOURCE="/mnt/c/Users/USER/Desktop/devops-foundations-lab"
BACKUP_DIR="/mnt/c/Users/USER/Desktop/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="devops-lab-backup-$DATE"

echo "=============================="
echo "  AUTOMATED BACKUP SCRIPT"
echo "=============================="
echo "Date: $DATE"
echo "Source: $SOURCE"
echo "Destination: $BACKUP_DIR/$BACKUP_NAME"
echo "=============================="

# Check if source folder exists
if [ ! -d "$SOURCE" ]; then
    echo "❌ ERROR: Source folder not found!"
    echo "❌ Backup FAILED!"
    exit 1
fi

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "📁 Creating backup directory..."
    mkdir -p "$BACKUP_DIR"
fi

# Perform the backup
echo "⏳ Starting backup..."
cp -r "$SOURCE" "$BACKUP_DIR/$BACKUP_NAME"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup SUCCESSFUL!"
    echo "✅ Saved to: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "❌ Backup FAILED!"
fi

echo "=============================="
