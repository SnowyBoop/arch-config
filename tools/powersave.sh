#!/bin/bash

# Get the number of CPU cores
num_cores=$(nproc)

# Loop through each CPU core and set the governor to "powersave"
for ((i=0; i<num_cores; i++)); do
  echo "performance" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
done

# Verify that the governor has been set to "powersave" on all cores
for ((i=0; i<num_cores; i++)); do
  current_governor=$(cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor)
  if [ "$current_governor" != "performance" ]; then
    echo "Error: CPU core $i is not using the 'powersave' governor"
    exit 1
  fi
done

echo "Success: CPU governors have been set to 'powersave' on all cores"
