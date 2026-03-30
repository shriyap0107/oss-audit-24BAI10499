#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Registration: [Your Reg Number]
# Course: Open Source Software | Chosen Software: Python
# Description: Asks 3 interactive questions and generates a
#              personalised open source philosophy statement,
#              saved to a .txt file.
# =============================================================
 
# --- Alias concept demonstration ---
# In a real shell session, you could run: alias gen='./script5_manifesto.sh'
# Aliases create shorthand commands — part of personalising your Linux experience
# alias gen='bash /path/to/script5_manifesto.sh'  # (alias shown as comment)
 
echo "============================================================"
echo "        Open Source Manifesto Generator"
echo "============================================================"
echo ""
echo "  This script will create a personal open-source philosophy"
echo "  statement based on your answers to three questions."
echo ""
echo "------------------------------------------------------------"
 
# --- Interactive input using 'read' with prompts ---
# -p flag shows a prompt message inline
read -p "1. Name one open-source tool you use every day: " TOOL
 
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
 
read -p "3. Name one thing you would build and share freely: " BUILD
 
# --- Validate that the user didn't leave answers blank ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo ""
    echo "Error: All three questions must be answered."
    echo "Please re-run the script and fill in all fields."
    exit 1
fi
 
# --- Date and output file setup ---
DATE=$(date '+%d %B %Y')                    # Current date formatted nicely
TIME=$(date '+%H:%M:%S')                    # Current time
OUTPUT="manifesto_$(whoami).txt"           # Output filename includes username
 
echo ""
echo "  Generating your manifesto..."
echo ""
 
# --- String concatenation to compose the manifesto paragraph ---
# We build it line by line using >> to append to the output file
# First use > to create/overwrite the file, then >> to append
 
# Write the header to the file
echo "============================================================" > "$OUTPUT"
echo "       MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "       Generated on: $DATE at $TIME" >> "$OUTPUT"
echo "       Author: $(whoami)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
# --- Write the main manifesto paragraph ---
# String concatenation: variables are embedded directly inside the text
echo "I believe that open-source software is not just a technical" >> "$OUTPUT"
echo "choice — it is a statement about the kind of world we want" >> "$OUTPUT"
echo "to build. Every day, I rely on $TOOL to do meaningful work," >> "$OUTPUT"
echo "and the fact that it was built freely and shared generously" >> "$OUTPUT"
echo "reminds me that collaboration beats competition." >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
echo "To me, freedom means $FREEDOM. In the context of software," >> "$OUTPUT"
echo "this translates to the right to read, modify, improve, and" >> "$OUTPUT"
echo "share the tools that shape our lives. A locked black box is" >> "$OUTPUT"
echo "the opposite of this. Open source is the only model that" >> "$OUTPUT"
echo "treats users as participants, not just consumers." >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
echo "If I could build and share one thing freely with the world," >> "$OUTPUT"
echo "it would be $BUILD. I would release it under an open" >> "$OUTPUT"
echo "license so that anyone — a student in Madhya Pradesh, a" >> "$OUTPUT"
echo "researcher in Berlin, a developer in Nairobi — could pick" >> "$OUTPUT"
echo "it up, learn from it, and make it better than I could alone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
echo "That is what open source means to me: the radical idea that" >> "$OUTPUT"
echo "knowledge grows when it is shared, and that the best tools" >> "$OUTPUT"
echo "in the world should belong to everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
 
echo "============================================================" >> "$OUTPUT"
echo "  Software audited: Python (PSF License)" >> "$OUTPUT"
echo "  Course: Open Source Software | VIT" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
 
# --- Confirm and display the manifesto ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
cat "$OUTPUT"
echo "------------------------------------------------------------"
echo ""
echo "  Your manifesto is ready. Share it, discuss it, improve it."
echo "  That is the open-source way."
echo "============================================================"
 