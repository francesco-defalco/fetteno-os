#!/bin/bash

# Charging thresholds to preserve battery health
START_LIMIT=30
STOP_LIMIT=90

# Standard path for the primary battery
BAT_PATH="/sys/class/power_supply/BAT0"

# Exit silently if battery directory does not exist (e.g., running on a desktop)
if [ ! -d "$BAT_PATH" ]; then
    exit 1
fi

# Detect the correct kernel file for the stop threshold
if [ -f "$BAT_PATH/charge_stop_threshold" ]; then
    STOP_FILE="charge_stop_threshold"
elif [ -f "$BAT_PATH/charge_control_end_threshold" ]; then
    STOP_FILE="charge_control_end_threshold"
else
    exit 1
fi

# Detect the correct kernel file for the start threshold
if [ -f "$BAT_PATH/charge_start_threshold" ]; then
    START_FILE="charge_start_threshold"
elif [ -f "$BAT_PATH/charge_control_start_threshold" ]; then
    START_FILE="charge_control_start_threshold"
else
    exit 1
fi

# Apply the thresholds directly to the hardware controllers
echo $STOP_LIMIT > "$BAT_PATH/$STOP_FILE"
echo $START_LIMIT > "$BAT_PATH/$START_FILE"
