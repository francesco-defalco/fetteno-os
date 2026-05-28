#!/bin/bash
START_LIMIT=30
STOP_LIMIT=90
BAT_PATH="/sys/class/power_supply/BAT0"

if [ ! -d "$BAT_PATH" ]; then
    exit 1
fi

if [ -f "$BAT_PATH/charge_stop_threshold" ]; then
    STOP_FILE="charge_stop_threshold"
elif [ -f "$BAT_PATH/charge_control_end_threshold" ]; then
    STOP_FILE="charge_control_end_threshold"
else
    exit 1
fi

if [ -f "$BAT_PATH/charge_start_threshold" ]; then
    START_FILE="charge_start_threshold"
elif [ -f "$BAT_PATH/charge_control_start_threshold" ]; then
    START_FILE="charge_control_start_threshold"
else
    exit 1
fi

echo $STOP_LIMIT > "$BAT_PATH/$STOP_FILE"
echo $START_LIMIT > "$BAT_PATH/$START_FILE"
