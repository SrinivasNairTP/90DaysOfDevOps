#!/bin/sh
# check service status

read -p "Enter a service to check: " service
read -p "Do you want to check the status of $service? (yes/no): " choice

if [ "$choice" = "yes" ]; then
    if systemctl is-active --quiet "$service"; then
        echo "✅ Service '$service' is started (running)"
    else
        echo "❌ Service '$service' is NOT running"
    fi
else
    echo "Skipped!!!"
fi





