#!/bin/bash
# Loops Demo Script
# Written by Ositadilima Nwabuisi

echo "=============================="
echo "  LOOPS DEMO"
echo "=============================="

# FOR loop — checking multiple servers
echo ""
echo "📡 Checking server status..."
echo ""

for SERVER in web-server-1 web-server-2 database-server backup-server; do
    echo "✅ Checking: $SERVER — Online"
done

echo ""
echo "=============================="

# FOR loop — processing files
echo ""
echo "📁 Processing report files..."
echo ""

for FILE in report1.txt report2.txt report3.txt; do
    echo "📄 Processing file: $FILE"
done

echo ""
echo "=============================="

# WHILE loop — countdown
echo ""
echo "⏳ Starting countdown..."
echo ""

COUNT=5
while [ $COUNT -gt 0 ]; do
    echo "  $COUNT seconds remaining..."
    COUNT=$((COUNT - 1))
done

echo "🚀 GO!"
echo "=============================="
