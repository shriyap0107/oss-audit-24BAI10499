#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Registration: [Your Reg Number]
# Course: Open Source Software | Chosen Software: Python
# Description: Loops through key system directories, reports
#              permissions, ownership, and disk usage for each
# =============================================================
 
# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/python3")
 
echo "============================================================"
echo "           Disk and Permission Auditor Report"
echo "============================================================"
echo ""
printf "%-25s %-25s %-10s\n" "Directory" "Permissions / Owner" "Size"
echo "------------------------------------------------------------"
 
# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
 
    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then
        # ls -ld gives a long listing of the directory itself (not its contents)
        # awk extracts: field 1 = permissions, field 3 = owner, field 4 = group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
 
        # du -sh gives human-readable size; cut extracts just the size part
        # 2>/dev/null suppresses permission-denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
 
        # Print formatted output for this directory
        printf "%-25s %-25s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        # Directory does not exist on this system
        printf "%-25s %-25s\n" "$DIR" "DOES NOT EXIST"
    fi
 
done
 
echo ""
echo "------------------------------------------------------------"
echo "  Python Configuration Directory Check"
echo "------------------------------------------------------------"
 
# --- Check Python-specific config and install directories ---
# These are the common locations where Python stores its files
 
PYTHON_DIRS=(
    "/usr/lib/python3"
    "/usr/lib/python3/dist-packages"
    "/usr/local/lib/python3.10"
    "/usr/local/lib/python3.11"
    "/etc/python3"
    "/usr/bin/python3"
)
 
for PDIR in "${PYTHON_DIRS[@]}"; do
    if [ -e "$PDIR" ]; then
        # -e checks for both files and directories
        PPERMS=$(ls -ld "$PDIR" | awk '{print $1, $3, $4}')
        echo "FOUND : $PDIR"
        echo "        Permissions: $PPERMS"
        echo ""
    fi
done
 
# --- Also show where Python binary lives ---
if command -v python3 &>/dev/null; then
    PYTHON_BIN=$(which python3)
    echo "Python binary location : $PYTHON_BIN"
    ls -lh "$PYTHON_BIN"
fi
 
echo ""
echo "============================================================"
echo " Why permissions matter in open-source systems:"
echo " Files owned by root with strict permissions prevent"
echo " unauthorized modification — even in free software,"
echo " security is a core value."
echo "============================================================"