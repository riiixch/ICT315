#!/bin/bash

disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if (( disk_usage > 90 )); then
    echo "Low disk space: $disk_usage% used"
else
    echo "Disk space is sufficient: $disk_usage% used"
fi