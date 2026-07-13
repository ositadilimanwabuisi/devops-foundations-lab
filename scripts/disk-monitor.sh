#!/bin/bash
# Disk Usage Monitor
# Written by Ositadilima Nwabuisi
# Purpose: Alert when disk usage is too high

# Variables
THRESHOLD=0
CURRENT_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')
DATE=$(date)

echo "=============================="
echo "  DISK USAGE MONITOR"
echo "=============================="
echo "Date: $DATE"
echo "Current Disk Usage: $CURRENT_USAGE%"
echo "Alert Threshold: $THRESHOLD%"
echo "=============================="

# Check if disk usage is above threshold
if [ $CURRENT_USAGE -gt $THRESHOLD ]; then
    echo " ALERT! Disk usage is at $CURRENT_USAGE%!"
    echo " This exceeds the $THRESHOLD% threshold!"
    echo " Please free up disk space immediately!"
else
    echo " Disk usage is at $CURRENT_USAGE% — All good!"
    echo " Below the $THRESHOLD% threshold."
fi

echo "=============================="
