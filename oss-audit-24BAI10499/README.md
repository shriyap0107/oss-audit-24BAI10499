# oss-audit-24BAI10499

## Open Source Software Audit — Python

**Student Name:** [Shriya Patel]
**Registration Number:** [24BAI10499]
**Course:** Open Source Software | VIT
**Submission Date:** March 31, 2026

---

## Chosen Software: Python

**License:** Python Software Foundation (PSF) License
**Repository:** [github.com/python/cpython](https://github.com/python/cpython)
**Official Site:** [python.org](https://python.org)

Python is a free, open-source, general-purpose programming language created by Guido van Rossum in 1989. It is the dominant language for AI, machine learning, data science, and automation, and is used by millions of developers worldwide under a permissive open-source licence that grants full freedom to use, modify, and distribute.

---

## Repository Structure

```
oss-audit-24BAI10499/
├── README.md                          ← This file
├── scripts/
│   ├── script1_system_identity.sh     ← System Identity Report
│   ├── script2_package_inspector.sh   ← FOSS Package Inspector
│   ├── script3_disk_auditor.sh        ← Disk and Permission Auditor
│   ├── script4_log_analyzer.sh        ← Log File Analyzer
│   └── script5_manifesto.sh           ← Open Source Manifesto Generator
```

---

## Scripts Overview

### Script 1 — System Identity Report
**File:** `scripts/script1_system_identity.sh`

Displays a formatted welcome screen showing the Linux distribution, kernel version, current user, home directory, system uptime, date/time, and the open-source licence covering the OS.

**Shell Concepts Used:** Variables, command substitution `$()`, `echo`, `if [ -f ]`, basic output formatting.

---

### Script 2 — FOSS Package Inspector
**File:** `scripts/script2_package_inspector.sh`

Checks whether Python is installed on the system using both `dpkg` (Debian/Ubuntu) and `rpm` (RHEL/Fedora). Displays package version and licence info, then uses a `case` statement to print a philosophy note about the package.

**Shell Concepts Used:** `if-then-else`, `case` statement, `dpkg`/`rpm`, pipe with `grep`, `command -v`.

---

### Script 3 — Disk and Permission Auditor
**File:** `scripts/script3_disk_auditor.sh`

Loops through a list of important system directories and reports the permissions, owner, group, and disk usage of each. Also checks for Python-specific installation directories.

**Shell Concepts Used:** Arrays, `for` loop, `[ -d ]` directory check, `ls -ld`, `du -sh`, `awk`, `cut`, `printf`.

---

### Script 4 — Log File Analyzer
**File:** `scripts/script4_log_analyzer.sh`

Reads a log file line by line, counts how many lines contain a specified keyword (default: `error`), and prints a summary with the last 5 matching lines. Includes file validation and retry logic.

**Shell Concepts Used:** `$1`/`$2` arguments, `${VAR:-default}`, `while IFS= read -r`, `[ ! -f ]`, counter variables `$(())`, `tail`, `grep -i`.

---

### Script 5 — Open Source Manifesto Generator
**File:** `scripts/script5_manifesto.sh`

Asks three interactive questions, then generates a personalised open-source philosophy statement and saves it to a `.txt` file in the current directory.

**Shell Concepts Used:** `read -p` (interactive input), input validation with `-z`, string concatenation with variables, `>` and `>>` file writing, `date`, alias concept via comment.

---

## How to Run Each Script on Linux

### Prerequisites

- A Linux system (Ubuntu, Fedora, Debian, or any common distro)
- Bash shell (version 4.0 or later recommended)
- Python 3 installed (for Scripts 2 and 3 to show package details)

### Step 1 — Clone the Repository

```bash
git clone https://github.com/[yourusername]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2 — Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

### Step 3 — Run Each Script

**Script 1 — System Identity Report:**
```bash
./scripts/script1_system_identity.sh
```
No arguments needed. Just run it and it displays your system information.

**Script 2 — FOSS Package Inspector:**
```bash
./scripts/script2_package_inspector.sh
```
No arguments needed. Checks for `python3` by default.

**Script 3 — Disk and Permission Auditor:**
```bash
./scripts/script3_disk_auditor.sh
```
No arguments needed. Audits standard Linux directories plus Python directories.

**Script 4 — Log File Analyzer:**
```bash
./scripts/script4_log_analyzer.sh /var/log/syslog error
```
Arguments:
- `$1` — Path to the log file (required)
- `$2` — Keyword to search for (optional, defaults to `error`)

Examples:
```bash
./scripts/script4_log_analyzer.sh /var/log/auth.log failed
./scripts/script4_log_analyzer.sh /var/log/syslog warning
```

**Script 5 — Open Source Manifesto Generator:**
```bash
./scripts/script5_manifesto.sh
```
No arguments. The script will ask three questions interactively. After answering, it saves your manifesto to `manifesto_[yourusername].txt` in the current directory and displays it.

---

## Dependencies

| Dependency | Purpose | Install Command |
|------------|---------|-----------------|
| bash | Shell interpreter | Pre-installed on all Linux systems |
| python3 | Package to be inspected | `sudo apt install python3` |
| coreutils | `ls`, `du`, `cut`, `wc` | Pre-installed on all Linux systems |
| grep | Pattern matching | Pre-installed on all Linux systems |
| awk | Text field extraction | Pre-installed on all Linux systems |

All dependencies except Python are part of the standard Linux base system. No additional installation is required beyond Python itself.

---

## Testing Environment

These scripts were written for and tested on:
- Ubuntu 22.04 LTS
- Bash 5.1
- Python 3.10

They should work on any modern Linux distribution running Bash 4.0+.

---

## Notes

- Scripts 2 and 3 attempt both `dpkg` and `rpm` queries to support both Debian and RHEL-family systems.
- Script 4 requires a readable log file. If `/var/log/syslog` does not exist on your system, try `/var/log/messages` or any other readable log file.
- All scripts include comments explaining each section, as required by the course rubric.
- Replace `Shriya Patel`, `24BAI10499`, and `24BAI10499` with your actual details before submission.