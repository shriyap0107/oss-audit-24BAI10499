#!/bin/bash 
# --- Student and Software Variables ---
STUDENT_NAME="Shriya Patel"      
REG_NUMBER="24BAI10499"    
SOFTWARE_CHOICE="Python"          # The open-source software we are auditing
 
# --- Collect System Information using command substitution ---
KERNEL=$(uname -r)                         # Linux kernel version
USER_NAME=$(whoami)                        # Currently logged-in user
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable system uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')      # Formatted current date
CURRENT_TIME=$(date '+%H:%M:%S')          # Current time in HH:MM:SS
 
# --- Get Linux Distribution Name ---
# /etc/os-release is the standard file containing distro info
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi
 
# --- License Information ---
# Python uses the PSF (Python Software Foundation) License
OS_LICENSE="GPL v2 (Linux Kernel) | PSF License (Python)"
 
# --- Display the Welcome Screen ---
echo "============================================================"
echo "        Open Source Audit — System Identity Report         "
echo "============================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Reg No    : $REG_NUMBER"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "------------------------------------------------------------"
echo "  $OS_LICENSE"
echo ""
echo "  Python is free software — you can use, copy, modify,"
echo "  and distribute it under the PSF License."
echo "============================================================"