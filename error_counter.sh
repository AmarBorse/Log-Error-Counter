#!/bin/bash
# ------------------------------------------------------------
# error_counter.sh - Log Error Counter
# Reads a log file, counts lines containing ERROR and shows
# the last 5 error lines. Shows a message if file is missing.
# Usage: ./error_counter.sh <logfile>
# ------------------------------------------------------------

LOG_FILE="${1:-application.log}"     # first argument, or default file name

# Check that the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: log file '$LOG_FILE' not found."
    exit 1
fi

# grep -c counts matching lines
COUNT=$(grep -c "ERROR" "$LOG_FILE")
echo "Total ERROR lines in $LOG_FILE: $COUNT"

if [ "$COUNT" -gt 0 ]; then
    echo "Last 5 errors:"
    echo "--------------"
    grep "ERROR" "$LOG_FILE" | tail -n 5
else
    echo "No errors found."
fi
