# The script will monitor the System
#  CPU and I/O  utilization
# Memory
# Diskspace
#!/bin/sh

cpuio=$(cat /proc/loadavg | awk '{print $1}')
disk=$(df -h | awk '$NF=="/" { printf "%s" ,$5}')
echo "Disk used $disk"
echo "CPU utilization $cpuio"
