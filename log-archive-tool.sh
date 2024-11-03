#!/bin/bash

# Check if the log directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

# Define variables
LOG_DIR="$1"
ARCHIVE_DIR="${LOG_DIR}/archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Start logging
echo "----------------------------------------" >> "$LOG_FILE"
echo "🗂️  Archiving Logs" >> "$LOG_FILE"
echo "Date & Time    : $(date +"%Y-%m-%d %H:%M:%S")" >> "$LOG_FILE"
echo "Source Dir     : $LOG_DIR" >> "$LOG_FILE"
echo "Destination    : ${ARCHIVE_DIR}/${ARCHIVE_FILE}" >> "$LOG_FILE"

# Compress logs in the specified directory and store the archive in the archive directory
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_FILE}" -C "$LOG_DIR" . &>/dev/null

# Check if the compression was successful
if [ $? -eq 0 ]; then
  ARCHIVE_SIZE=$(du -h "${ARCHIVE_DIR}/${ARCHIVE_FILE}" | cut -f1)
  echo "Archive Size   : $ARCHIVE_SIZE" >> "$LOG_FILE"
  echo "Status         : ✅ SUCCESS" >> "$LOG_FILE"
  echo "Logs successfully archived as ${ARCHIVE_FILE} in ${ARCHIVE_DIR}."
else
  echo "Status         : ❌ FAILED" >> "$LOG_FILE"
  echo "Error: Failed to create archive."
  exit 1
fi

# End log entry
echo "----------------------------------------" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"  # Blank line for readability
