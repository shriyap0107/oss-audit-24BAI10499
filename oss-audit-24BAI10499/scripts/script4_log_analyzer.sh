#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Registration: [Your Reg Number]
# Course: Open Source Software | Chosen Software: Python
# Description: Reads a log file line by line, counts keyword
#              matches, and prints a summary with last 5 hits.
# Usage: ./script4_log_analyzer.sh /path/to/logfile [KEYWORD]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================
 
# --- Command-line arguments ---
# $1 is the first argument (log file path)
LOGFILE=$1
# $2 is the optional keyword; default is 'error' if not provided
KEYWORD=${2:-"error"}
 
# --- Counter variable to track matches ---
COUNT=0
 
# --- Temporary file to store matching lines for later display ---
MATCHES_FILE="/tmp/log_matches_$$.txt"
 
echo "============================================================"
echo "             Log File Analyzer"
echo "============================================================"
 
# --- Validate: check that the user actually provided a file path ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi
 
# --- Validate: check that the log file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Tip: Try /var/log/syslog, /var/log/auth.log, or /var/log/messages"
    exit 1
fi
 
# --- Check if the file is empty; retry logic ---
# This demonstrates a do-while style pattern in bash
RETRY=0
MAX_RETRY=2
 
while [ ! -s "$LOGFILE" ]; do
    # -s checks if file is non-empty
    RETRY=$((RETRY + 1))
    echo "Warning: Log file appears to be empty. Retry $RETRY of $MAX_RETRY..."
    sleep 1
 
    if [ $RETRY -ge $MAX_RETRY ]; then
        echo "File is empty after $MAX_RETRY checks. Exiting."
        exit 1
    fi
done
 
echo "Scanning : $LOGFILE"
echo "Keyword  : '$KEYWORD'"
echo ""
 
# --- Main loop: read the log file line by line ---
while IFS= read -r LINE; do
    # IFS= prevents stripping leading whitespace
    # -r prevents backslash interpretation
 
    # Check if this line contains our keyword (case-insensitive with -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment our counter
        COUNT=$((COUNT + 1))
 
        # Save matching line to temp file for display later
        echo "$LINE" >> "$MATCHES_FILE"
    fi
 
done < "$LOGFILE"   # Redirect file into the while loop
 
# --- Print summary ---
echo "------------------------------------------------------------"
echo "  RESULTS SUMMARY"
echo "------------------------------------------------------------"
echo "  Total lines scanned : $(wc -l < "$LOGFILE")"
echo "  Keyword '$KEYWORD' found : $COUNT time(s)"
echo ""
 
# --- Show last 5 matching lines if any were found ---
if [ $COUNT -gt 0 ] && [ -f "$MATCHES_FILE" ]; then
    echo "  Last 5 matching lines:"
    echo "  ......................................................."
    # tail gets last 5 lines; we also use grep to highlight the keyword
    tail -5 "$MATCHES_FILE" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  No lines matched the keyword '$KEYWORD'."
fi
 
echo ""
echo "------------------------------------------------------------"
echo "  Open Source Insight:"
echo "  Linux logs like /var/log/syslog are human-readable plain"
echo "  text — a core FOSS philosophy. Transparent systems allow"
echo "  users and admins to understand exactly what is happening."
echo "------------------------------------------------------------"
echo "============================================================"
 
# --- Clean up temp file ---
rm -f "$MATCHES_FILE"