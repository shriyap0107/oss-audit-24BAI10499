#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Registration: [Your Reg Number]
# Course: Open Source Software | Chosen Software: Python
# Description: Checks if a FOSS package is installed, shows
#              its version/license, and prints a philosophy note
# =============================================================
 
# --- The package we want to inspect ---
# On most Linux systems, Python 3 is available as 'python3'
PACKAGE="python3"
 
echo "============================================================"
echo "           FOSS Package Inspector"
echo "============================================================"
echo ""
 
# --- Check if the package is installed using if-then-else ---
# We try dpkg first (Debian/Ubuntu), then rpm (RHEL/CentOS/Fedora)
if dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
    # Package found via dpkg (Debian/Ubuntu systems)
    echo "[OK] $PACKAGE is installed on this system (dpkg)."
    echo ""
    echo "--- Package Details ---"
    # Use dpkg -l and grep to extract version and description
    dpkg -l "$PACKAGE" | grep -E "^ii" | awk '{print "Version : "$3"\nArch    : "$4"\nDesc    : "$5" "$6" "$7" "$8}'
 
elif rpm -q "$PACKAGE" &>/dev/null 2>&1; then
    # Package found via rpm (RHEL/Fedora/CentOS systems)
    echo "[OK] $PACKAGE is installed on this system (rpm)."
    echo ""
    echo "--- Package Details ---"
    # rpm -qi gives detailed info; grep filters relevant lines
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|URL'
 
else
    # Package is not found by either package manager
    echo "[NOT FOUND] $PACKAGE is NOT installed on this system."
    echo "To install Python on Ubuntu/Debian : sudo apt install python3"
    echo "To install Python on RHEL/Fedora   : sudo dnf install python3"
fi
 
echo ""
 
# --- Check Python version directly (even if not via package manager) ---
if command -v python3 &>/dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1)
    echo "Direct check: $PYTHON_VERSION is available at $(which python3)"
fi
 
echo ""
echo "------------------------------------------------------------"
echo "  Open Source Philosophy Notes"
echo "------------------------------------------------------------"
 
# --- Case statement: prints a philosophy note based on package name ---
case "$PACKAGE" in
    python3 | python)
        echo "Python: A language shaped entirely by its community."
        echo "Guido van Rossum started it in 1989 as a hobby project."
        echo "Today it powers AI, science, web, and automation — all free."
        ;;
    httpd | apache2)
        echo "Apache: The web server that built the open internet."
        echo "Born in 1995 from patches to an abandoned NCSA project."
        ;;
    mysql | mariadb)
        echo "MySQL: Open source at the heart of millions of apps."
        echo "A dual-license story — community vs commercial coexisting."
        ;;
    firefox)
        echo "Firefox: A nonprofit fighting for an open, free web."
        echo "Mozilla's answer to browser monopoly and closed standards."
        ;;
    vlc)
        echo "VLC: Built by students in Paris to stream campus videos."
        echo "Now plays literally anything — freely, everywhere."
        ;;
    git)
        echo "Git: Linus Torvalds built it in 2 weeks after a license dispute."
        echo "Now the backbone of all modern software collaboration."
        ;;
    *)
        # Default case for any other package
        echo "$PACKAGE: An open-source tool that someone chose to share freely."
        echo "Every FOSS project represents a choice to give, not just take."
        ;;
esac
 
echo "============================================================"
 