#!/bin/bash
# SECURITY MANIFEST:
# Environment variables accessed: HOME
# External endpoints called: none
# Local files read: /home/username/
# Local files written: ~/reports/cleanup_report_*.md, /tmp/duplicates.txt
set -euo pipefail

# Cleanup Reporter Scanner Script
REPORT_DIR="${HOME}/reports"
mkdir -p "${REPORT_DIR}"
REPORT_FILE="${REPORT_DIR}/cleanup_report_$(date +%Y-%m-%d).md"

echo "# Cleanup Report - $(date)" > "$REPORT_FILE"
echo "## Large Directories (Top 20)" >> "$REPORT_FILE"
# Scan user home directory
ncdu -o - /home/username | head -n 20 >> "$REPORT_FILE"

echo -e "\n## Potential Duplicate Files" >> "$REPORT_FILE"
echo "Running rdfind scan... this may take a moment."
# Use paths with 'username'
rdfind -dryrun true -outputname /tmp/duplicates.txt /home/username/Documents /home/username/Downloads
echo "Scan complete. Check /tmp/duplicates.txt for full list." >> "$REPORT_FILE"
echo "Found duplicates (see /tmp/duplicates.txt)." >> "$REPORT_FILE"

echo -e "\n## Oldest Resume Files" >> "$REPORT_FILE"
find /home/username -iname "*resume*" -type f -printf "%T+ %p\n" | sort >> "$REPORT_FILE"

echo -e "\nReport generated at $REPORT_FILE"
