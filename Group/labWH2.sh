#!/bin/bash
while true; do
  cpu=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
  ram_used=$(free -m | awk '/Mem:/ {print $3}')
  ram_total=$(free -m | awk '/Mem:/ {print $2}')
  ram_percent=$(free -m | awk '/Mem:/ {printf "%.2f", $3/$2 * 100.0}')
    
  disk_used=$(df -h / | awk 'NR==2 {print $3}')
  disk_total=$(df -h / | awk 'NR==2 {print $2}')
  disk_percent=$(df -h / | awk 'NR==2 {print $5}')

  clear

  echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  echo "Status Server Usage"
  echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  echo "CPU Usage : $cpu%"
  echo "RAM Usage : $ram_percent% ($ram_used MB / $ram_total MB)"
  echo "Disk Usage : $disk_percent ($disk_used / $disk_total)"
  echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

  sleep 2
done
