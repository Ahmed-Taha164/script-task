#!/bin/bash
date=$(date)
echo "System monitoring alert : $date"

echo "============================"

echo "Disk usage : "

my_disk="df -h / "

usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

$my_disk

if [ "$usage" -gt 30 ]; then
            echo "DIsk usage is greater than 30% : $usage%" | mail -s "Warning from Ubunto machine" ahmedtaha1642@gmail.com
      	echo "Disk usage is above 30%. Current usage: $usage%"
fi

echo "==================="

echo "Cpu usage"

cpu=$(mpstat 1 5 | awk 'END{print 100-$NF"%"}')
echo "Cpu usage = $cpu"

echo "==================="

echo"Memory usage"
total_mem=$(free -h | awk 'NR==2 {print $2}')
used_mem=$(free -h | awk 'NR==2 {print $3}')
free_mem=$(free -h | awk 'NR==2 {print $4}')
echo "Total Memory = $total_mem G"
echo "Used Memory = $used_mem G"
echo "Free Memory = $free_mem G"

echo "=================="

top_pro=$(top | head -12 | tail -6)

echo "$top_pro"



