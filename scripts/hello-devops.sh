# Check if scripts folder exists
if [ -d "/mnt/c/Users/USER/Desktop/devops-foundations-lab/scripts" ]; then
    echo "✅ Scripts folder EXISTS — we are in the right place!"
else
    echo "❌ Scripts folder NOT FOUND — something is wrong!"
fi
