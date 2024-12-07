#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

if (( $(echo "$cpu_usage > 80" | bc -l) )); then
    echo "High CPU usage: $cpu_usage%"
else
    echo "CPU usage is normal: $cpu_usage%"
fi