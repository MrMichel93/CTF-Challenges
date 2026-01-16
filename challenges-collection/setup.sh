#!/bin/bash

# CTF Challenges Collection - Combined Setup Script
# This script sets up all 8 challenges in one environment

clear

cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║           CTF CHALLENGES COLLECTION (Challenges 1-8)           ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝

Welcome to the CTF Challenges Collection!

This is a collection of 8 security and Linux challenges designed
to help you learn various system administration and security skills.

GETTING STARTED:
================

After running this setup script, you'll have access to all challenges.

To see the available challenges:
  ls

To navigate into a specific challenge:
  cd challenge1-hidden-files
  cd challenge2-process-detective
  ... and so on

Each challenge directory contains:
  - A README.md file with challenge details
  - Challenge-specific files and artifacts

CHALLENGE OVERVIEW:
===================

Challenge 1: Hidden Files Explorer
  Skills: File navigation, hidden files, basic commands
  
Challenge 2: Process Detective
  Skills: Process management, ps, grep, kill
  
Challenge 3: Network Navigator
  Skills: Network analysis, curl, wget
  
Challenge 4: Log File Forensics
  Skills: Log analysis, text processing, grep
  
Challenge 5: Permission Puzzle
  Skills: Linux permissions, chmod
  
Challenge 6: Archive Archaeology
  Skills: Archive extraction, file types
  
Challenge 7: Script Debugger
  Skills: Bash scripting, debugging
  
Challenge 8: System Intrusion Analysis
  Skills: Forensics, incident response

Press ENTER to begin setup...
EOF

read -r

echo ""
echo "Starting setup of all 8 challenges..."
echo ""

# Challenge 1: Hidden Files Explorer
echo "[1/8] Setting up Challenge 1: Hidden Files Explorer..."
mkdir -p challenge1-hidden-files
cd challenge1-hidden-files

# Create main directory
mkdir -p mystery_dir

# Create some regular visible files as decoys
echo "This is not the flag." > mystery_dir/readme.txt
echo "Keep searching!" > mystery_dir/note.txt
mkdir -p mystery_dir/documents
echo "Nothing here either." > mystery_dir/documents/report.txt

# Create hidden directory
mkdir -p mystery_dir/.secrets

# Create the flag in a hidden file
echo "FLAG{h1dd3n_f1l3s_4r3_3v3rywh3r3}" > mystery_dir/.secrets/.hidden_treasure

# Create some additional hidden files as decoys
echo "Almost there..." > mystery_dir/.secrets/.clue
echo "You're getting warmer!" > mystery_dir/.cache

# Create another hidden directory with a decoy
mkdir -p mystery_dir/.config
echo "This is just a config file." > mystery_dir/.config/settings

cat > README.md << 'READMEEOF'
# Challenge 1: Hidden Files Explorer

Navigate to the 'mystery_dir' directory and start searching for the flag.
Hint: The flag format is FLAG{...}
READMEEOF

cd ..
echo "✓ Challenge 1 complete"

# Challenge 2: Process Detective
echo "[2/8] Setting up Challenge 2: Process Detective..."
mkdir -p challenge2-process-detective
cd challenge2-process-detective

# Create a script that will run as a background process
cat > /tmp/secret_process_$$.sh << 'PROCEOF'
#!/bin/bash
# This is a secret process containing: FLAG{pr0c3ss_m4st3r_d3t3ct1v3}
while true; do
    sleep 60
done
PROCEOF

chmod +x /tmp/secret_process_$$.sh

# Start the background process
nohup /tmp/secret_process_$$.sh > /dev/null 2>&1 &
PID=$!

cat > README.md << READMEEOF
# Challenge 2: Process Detective

A secret process has been started in the background.
Your mission: Find the process and extract the flag from it.

Hint: The process has 'secret' in its name.
Use commands like 'ps', 'pgrep', and 'grep' to investigate.

When you're done, you can stop the process with:
  kill $PID
  or: pkill -f secret_process
READMEEOF

cd ..
echo "✓ Challenge 2 complete"

# Challenge 3: Network Navigator
echo "[3/8] Setting up Challenge 3: Network Navigator..."
mkdir -p challenge3-network-navigator
cd challenge3-network-navigator

# Create network configuration file
cat > network_config.txt << 'NETEOF'
# Network Configuration File
# Server Configuration Details

[Server Information]
Hostname: challenge-server
IP Address: 127.0.0.1
Region: localhost

[Connection Details]
Primary Port: 8888
Protocol: HTTP
Endpoint URL: http://localhost:8888/flag.txt

[Database]
Host: 127.0.0.1
Port: 3306
Type: MySQL

[Additional Notes]
- Check the endpoint URL for the flag
- Use curl or wget to retrieve data
- Server is running locally

NETEOF

# Create a temporary directory for the web server
mkdir -p /tmp/challenge3_webserver_$$

# Create the flag file
echo "FLAG{n3tw0rk_n1nj4_m4st3r}" > /tmp/challenge3_webserver_$$/flag.txt

# Create an index page
cat > /tmp/challenge3_webserver_$$/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html>
<head><title>Challenge Server</title></head>
<body>
<h1>Welcome to the Challenge Server</h1>
<p>The flag is in flag.txt</p>
</body>
</html>
HTMLEOF

# Start a simple Python HTTP server in the background
cd /tmp/challenge3_webserver_$$
python3 -m http.server 8888 > /dev/null 2>&1 &
SERVER_PID=$!

# Save the PID for cleanup
echo $SERVER_PID > /tmp/challenge3_server_pid_$$

cd - > /dev/null

cat > README.md << READMEEOF
# Challenge 3: Network Navigator

A web server has been started on http://localhost:8888
Check the 'network_config.txt' file for details.

Your mission: Analyze the network configuration and retrieve the flag.

When finished, stop the server with:
  kill $SERVER_PID

Or run:
  pkill -f 'http.server 8888'
READMEEOF

cd ..
echo "✓ Challenge 3 complete"

# Challenge 4: Log File Forensics
echo "[4/8] Setting up Challenge 4: Log File Forensics..."
mkdir -p challenge4-log-forensics
cd challenge4-log-forensics

# Generate a realistic web server access log with the flag hidden inside
cat > access.log << 'LOGEOF'
192.168.1.100 - - [15/Dec/2024:10:23:45 +0000] "GET /index.html HTTP/1.1" 200 1234 "-" "Mozilla/5.0"
192.168.1.101 - - [15/Dec/2024:10:24:12 +0000] "GET /about.html HTTP/1.1" 200 2345 "-" "Mozilla/5.0"
10.0.0.50 - - [15/Dec/2024:10:25:33 +0000] "POST /api/login HTTP/1.1" 200 156 "-" "curl/7.68.0"
192.168.1.102 - - [15/Dec/2024:10:26:01 +0000] "GET /images/logo.png HTTP/1.1" 200 45678 "-" "Mozilla/5.0"
192.168.1.103 - - [15/Dec/2024:10:27:15 +0000] "GET /contact.html HTTP/1.1" 200 1987 "-" "Mozilla/5.0"
172.16.0.20 - - [15/Dec/2024:10:28:42 +0000] "GET /admin HTTP/1.1" 404 162 "-" "Mozilla/5.0"
192.168.1.104 - - [15/Dec/2024:10:29:18 +0000] "GET /products.html HTTP/1.1" 200 3456 "-" "Mozilla/5.0"
10.0.0.51 - - [15/Dec/2024:10:30:05 +0000] "GET /api/users HTTP/1.1" 200 8765 "-" "Python-requests/2.25.1"
192.168.1.105 - - [15/Dec/2024:10:31:22 +0000] "GET /services.html HTTP/1.1" 200 2876 "-" "Mozilla/5.0"
192.168.1.106 - - [15/Dec/2024:10:32:44 +0000] "POST /api/submit HTTP/1.1" 201 89 "-" "Mozilla/5.0"
192.168.1.107 - - [15/Dec/2024:10:33:19 +0000] "GET /blog/post1 HTTP/1.1" 200 4532 "-" "Mozilla/5.0"
172.16.0.21 - - [15/Dec/2024:10:34:55 +0000] "GET /login HTTP/1.1" 200 1765 "-" "Mozilla/5.0"
192.168.1.108 - - [15/Dec/2024:10:35:31 +0000] "GET /static/style.css HTTP/1.1" 200 12345 "-" "Mozilla/5.0"
10.0.0.52 - - [15/Dec/2024:10:36:08 +0000] "GET /api/data HTTP/1.1" 200 5643 "-" "curl/7.68.0"
192.168.1.109 - - [15/Dec/2024:10:37:42 +0000] "GET /gallery.html HTTP/1.1" 200 8765 "-" "Mozilla/5.0"
192.168.1.110 - - [15/Dec/2024:10:38:15 +0000] "GET /faq.html HTTP/1.1" 200 3421 "-" "Mozilla/5.0"
10.0.0.53 - - [15/Dec/2024:10:39:27 +0000] "POST /api/update HTTP/1.1" 200 234 "-" "Python-requests/2.25.1"
192.168.1.111 - - [15/Dec/2024:10:40:03 +0000] "GET /privacy.html HTTP/1.1" 200 2198 "-" "Mozilla/5.0"
192.168.1.112 - - [15/Dec/2024:10:41:38 +0000] "GET /download/file.pdf HTTP/1.1" 200 987654 "-" "Mozilla/5.0"
172.16.0.22 - - [15/Dec/2024:10:42:51 +0000] "GET /admin/panel HTTP/1.1" 403 143 "-" "Mozilla/5.0"
192.168.1.113 - - [15/Dec/2024:10:43:14 +0000] "GET /news.html HTTP/1.1" 200 4567 "-" "Mozilla/5.0"
10.0.0.54 - - [15/Dec/2024:10:44:29 +0000] "GET /api/status HTTP/1.1" 200 123 "-" "curl/7.68.0"
192.168.1.114 - - [15/Dec/2024:10:45:02 +0000] "GET /careers.html HTTP/1.1" 200 3210 "-" "Mozilla/5.0"
192.168.1.115 - - [15/Dec/2024:10:46:37 +0000] "POST /search?q=test HTTP/1.1" 200 2345 "-" "Mozilla/5.0"
192.168.1.116 - - [15/Dec/2024:10:47:11 +0000] "GET /portfolio.html HTTP/1.1" 200 5432 "-" "Mozilla/5.0"
10.0.0.55 - - [15/Dec/2024:10:48:45 +0000] "GET /secret_endpoint?data=FLAG{l0g_f1l3_f0r3ns1cs_3xp3rt} HTTP/1.1" 200 89 "-" "SuspiciousBot/1.0"
192.168.1.117 - - [15/Dec/2024:10:49:18 +0000] "GET /team.html HTTP/1.1" 200 3987 "-" "Mozilla/5.0"
192.168.1.118 - - [15/Dec/2024:10:50:33 +0000] "GET /testimonials.html HTTP/1.1" 200 4123 "-" "Mozilla/5.0"
172.16.0.23 - - [15/Dec/2024:10:51:06 +0000] "GET /robots.txt HTTP/1.1" 200 87 "-" "Googlebot/2.1"
192.168.1.119 - - [15/Dec/2024:10:52:41 +0000] "GET /sitemap.xml HTTP/1.1" 200 2456 "-" "Bingbot/2.0"
192.168.1.120 - - [15/Dec/2024:10:53:15 +0000] "POST /api/feedback HTTP/1.1" 201 156 "-" "Mozilla/5.0"
10.0.0.56 - - [15/Dec/2024:10:54:28 +0000] "GET /api/metrics HTTP/1.1" 200 9876 "-" "Python-requests/2.25.1"
192.168.1.121 - - [15/Dec/2024:10:55:02 +0000] "GET /features.html HTTP/1.1" 200 4321 "-" "Mozilla/5.0"
192.168.1.122 - - [15/Dec/2024:10:56:37 +0000] "GET /pricing.html HTTP/1.1" 200 3654 "-" "Mozilla/5.0"
192.168.1.123 - - [15/Dec/2024:10:57:11 +0000] "GET /support.html HTTP/1.1" 200 2987 "-" "Mozilla/5.0"
172.16.0.24 - - [15/Dec/2024:10:58:45 +0000] "GET /backup.zip HTTP/1.1" 404 162 "-" "Mozilla/5.0"
192.168.1.124 - - [15/Dec/2024:10:59:19 +0000] "GET /compare.html HTTP/1.1" 200 5123 "-" "Mozilla/5.0"
192.168.1.125 - - [15/Dec/2024:11:00:33 +0000] "GET /documentation.html HTTP/1.1" 200 8765 "-" "Mozilla/5.0"
10.0.0.57 - - [15/Dec/2024:11:01:07 +0000] "POST /api/webhook HTTP/1.1" 200 45 "-" "GitHub-Hookshot/abc123"
192.168.1.126 - - [15/Dec/2024:11:02:42 +0000] "GET /changelog.html HTTP/1.1" 200 3456 "-" "Mozilla/5.0"
192.168.1.127 - - [15/Dec/2024:11:03:16 +0000] "GET /terms.html HTTP/1.1" 200 6789 "-" "Mozilla/5.0"
LOGEOF

cat > README.md << 'READMEEOF'
# Challenge 4: Log File Forensics

A log file 'access.log' has been generated with 40 entries.
Your mission: Find the flag hidden in the log file.

Hints:
  - The flag is in the standard FLAG{...} format
  - Look for suspicious requests or unusual patterns
  - Use grep, awk, and other text processing tools

Start your investigation with: cat access.log
READMEEOF

cd ..
echo "✓ Challenge 4 complete"

# Challenge 5: Permission Puzzle
echo "[5/8] Setting up Challenge 5: Permission Puzzle..."
mkdir -p challenge5-permission-puzzle
cd challenge5-permission-puzzle

# Create the vault directory
mkdir -p vault/locked_dir

# Create instructions file (initially not readable)
cat > vault/instructions.txt << 'INSTEOF'
VAULT SECURITY INSTRUCTIONS
============================

To access the vault contents, you must:
1. Make this file readable (it's currently write-only)
2. Navigate to the locked_dir (fix directory permissions)
3. Read the secret.txt file (fix its permissions)

The flag awaits those who understand Linux permissions!
INSTEOF

chmod 200 vault/instructions.txt  # Write-only

# Create the secret file with the flag (initially not readable)
echo "FLAG{p3rm1ss10n_m4st3r_unl0ck3d}" > vault/locked_dir/secret.txt
chmod 000 vault/locked_dir/secret.txt  # No permissions

# Make the directory inaccessible initially
chmod 000 vault/locked_dir

# Create some decoy files with various permissions
echo "This is a decoy file." > vault/decoy1.txt
chmod 444 vault/decoy1.txt  # Read-only

echo "Another decoy file." > vault/decoy2.txt
chmod 111 vault/decoy2.txt  # Execute-only (weird but possible)

mkdir -p vault/empty_dir
chmod 755 vault/empty_dir

cat > README.md << 'READMEEOF'
# Challenge 5: Permission Puzzle

The vault has been created with various permission challenges.

Your mission: Navigate the permission restrictions and find the flag.

Start by examining the vault directory:
  cd vault
  ls -la

Hint: Not everything is accessible at first. You'll need to fix permissions!

Key commands you'll need:
  ls -l    (view permissions)
  chmod    (change permissions)
  cat      (read files)
READMEEOF

cd ..
echo "✓ Challenge 5 complete"

# Challenge 6: Archive Archaeology
echo "[6/8] Setting up Challenge 6: Archive Archaeology..."
mkdir -p challenge6-archive-archaeology
cd challenge6-archive-archaeology

# Create temporary directory for building nested archives
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Create the innermost file with the flag
echo "FLAG{4rch1v3_4rch4301og1st_m4st3r}" > flag.txt

# Layer 5: Create tar archive
tar -cf layer5.tar flag.txt
rm flag.txt

# Layer 4: Compress with gzip
gzip layer5.tar
mv layer5.tar.gz layer4.gz

# Layer 3: Create tar.bz2 archive
tar -cjf layer3.tar.bz2 layer4.gz
rm layer4.gz

# Layer 2: Create zip archive
zip -q layer2.zip layer3.tar.bz2
rm layer3.tar.bz2

# Layer 1: Create tar.gz archive
tar -czf layer1.tar.gz layer2.zip
rm layer2.zip

# Move to original location
mv layer1.tar.gz "$OLDPWD/"
cd "$OLDPWD"
rm -rf "$TEMP_DIR"

cat > README.md << 'READMEEOF'
# Challenge 6: Archive Archaeology

A nested archive 'layer1.tar.gz' has been created.

Your mission: Extract all the layers to find the flag.

Tips:
  - Use 'file' command to identify archive types
  - Extract one layer at a time
  - Keep track of what you've extracted

Archive structure:
  layer1.tar.gz
    └─ layer2.zip
        └─ layer3.tar.bz2
            └─ layer4.gz
                └─ layer5.tar
                    └─ flag.txt

Start with: tar -xzf layer1.tar.gz
READMEEOF

cd ..
echo "✓ Challenge 6 complete"

# Challenge 7: Script Debugger
echo "[7/8] Setting up Challenge 7: Script Debugger..."
mkdir -p challenge7-script-debugger
cd challenge7-script-debugger

# Create a broken script with multiple errors
cat > broken_script.sh << 'SCRIPTEOF'
#!/bin/bash
# This script is broken! Fix all the errors to reveal the flag.

# Error 1: Missing quotes around string with spaces
MESSAGE=Welcome to the debugger challenge

# Error 2: Wrong variable syntax (missing $)
echo message

# Error 3: Incorrect comparison operator (= instead of -eq for numbers)
NUMBER=42
if [ $NUMBER = 42 ]; then
    echo "Number check passed"
fi

# Error 4: Missing quotes around variable in string comparison
STRING="test"
if [ $STRING = "test" ]; then
    echo "String check passed"
fi

# Error 5: Missing 'then' keyword
if [ -f "/etc/passwd" ]
    echo "File exists"
fi

# Error 6: Missing 'done' for loop
COUNTER=0
for i in 1 2 3
do
    COUNTER=$((COUNTER + 1))

# Error 7: Incorrect arithmetic syntax
RESULT=5+5
echo "Result: $RESULT"

# Error 8: Missing closing quote
echo "This string is not closed properly

# If all errors are fixed, reveal the flag
FLAG="FLAG{scr1pt_d3bugg1ng_m4st3r}"
echo "Congratulations! Here's your flag: $FLAG"
SCRIPTEOF

cat > README.md << 'READMEEOF'
# Challenge 7: Script Debugger

A broken script 'broken_script.sh' has been created.

Your mission: Fix all the errors in the script so it runs successfully.

To get started:
  1. View the script: cat broken_script.sh
  2. Try to run it: bash broken_script.sh
  3. Read error messages carefully
  4. Fix errors one at a time
  5. Test after each fix

Helpful commands:
  bash broken_script.sh      # Run the script
  bash -x broken_script.sh   # Run with debug output
  bash -n broken_script.sh   # Check syntax without running

Types of errors to look for:
  - Missing quotes
  - Wrong comparison operators
  - Missing keywords (then, fi, done)
  - Incorrect variable syntax
  - Unclosed strings
  - Wrong arithmetic syntax
READMEEOF

cd ..
echo "✓ Challenge 7 complete"

# Challenge 8: System Intrusion Analysis
echo "[8/8] Setting up Challenge 8: System Intrusion Analysis..."
mkdir -p challenge8-intrusion-analysis
cd challenge8-intrusion-analysis

# Create incident directory structure
mkdir -p incident/logs
mkdir -p incident/suspicious_files/.attacker_data
mkdir -p incident/user_data

# Create auth log with suspicious activities
cat > incident/logs/auth.log << 'AUTHEOF'
Dec 15 08:23:45 server sshd[1234]: Failed password for root from 192.168.1.100 port 45678 ssh2
Dec 15 08:23:50 server sshd[1235]: Failed password for root from 192.168.1.100 port 45679 ssh2
Dec 15 08:23:55 server sshd[1236]: Failed password for root from 192.168.1.100 port 45680 ssh2
Dec 15 08:24:12 server sshd[1237]: Failed password for admin from 192.168.1.100 port 45681 ssh2
Dec 15 08:24:18 server sshd[1238]: Failed password for admin from 192.168.1.100 port 45682 ssh2
Dec 15 08:24:45 server sshd[1239]: Accepted password for backup from 192.168.1.100 port 45683 ssh2
Dec 15 08:25:01 server sudo: backup : TTY=pts/0 ; PWD=/home/backup ; USER=root ; COMMAND=/bin/bash
Dec 15 08:25:01 server sudo: pam_unix(sudo:session): session opened for user root by backup(uid=0)
Dec 15 08:26:30 server sshd[1239]: Received disconnect from 192.168.1.100 port 45683:11: disconnected by user
Dec 15 08:26:30 server sshd[1239]: Disconnected from user backup 192.168.1.100 port 45683
Dec 15 09:15:22 server sshd[1456]: Accepted publickey for backup from 192.168.1.100 port 46789 ssh2
Dec 15 09:15:45 server sudo: backup : TTY=pts/1 ; PWD=/home/backup ; USER=root ; COMMAND=/usr/bin/find / -name "*.conf"
Dec 15 09:16:12 server sshd[1456]: Received disconnect from 192.168.1.100 port 46789:11: disconnected by user
AUTHEOF

# Create bash history showing attacker commands
cat > incident/.bash_history << 'BASHEOF'
whoami
id
uname -a
cat /etc/passwd
cat /etc/shadow
ls -la /root
find / -name "*.conf" 2>/dev/null
ps aux
netstat -tulpn
history
cat /var/log/auth.log | grep -i failed
mkdir .attacker_data
cd .attacker_data
echo "RkxBR3tzeXN0M21fYnIzNGNoX2QzdDNjdDNkX2Y0MTFz}" > .hidden_flag.txt
chmod 600 .hidden_flag.txt
cd ..
history -c
BASHEOF

# Create the hidden flag (base64 encoded)
echo "RkxBR3tzeXN0M21fYnIzNGNoX2QzdDNjdDNkX2Y0MTFz}" > incident/suspicious_files/.attacker_data/.hidden_flag.txt
chmod 600 incident/suspicious_files/.attacker_data/.hidden_flag.txt

# Create some decoy suspicious files
cat > incident/suspicious_files/suspicious_script.sh << 'SUSPEOF'
#!/bin/bash
# This looks suspicious but is a decoy
nc -l 4444 &
SUSPEOF
chmod 755 incident/suspicious_files/suspicious_script.sh

cat > incident/suspicious_files/README.txt << 'SREADEOF'
This directory contains files recovered from the compromised system.
Look carefully through all files, including hidden ones.
The attacker was sophisticated and tried to cover their tracks.
SREADEOF

# Create a timeline file
cat > incident/timeline.txt << 'TIMEEOF'
INCIDENT TIMELINE ANALYSIS
===========================

08:23:45 - Multiple failed SSH login attempts for root account from 192.168.1.100
08:24:12 - Failed login attempts switch to 'admin' account
08:24:45 - SUCCESSFUL login as 'backup' user from 192.168.1.100
08:25:01 - User 'backup' escalates to root using sudo
08:26:30 - Session disconnected
09:15:22 - Attacker returns using SSH key authentication
09:15:45 - Root commands executed to search for config files
09:16:12 - Session disconnected

QUESTIONS TO INVESTIGATE:
1. How did the attacker gain initial access?
2. What commands did they run?
3. What did they leave behind?
4. Where is the flag hidden?

HINT: Check the .bash_history file and look for hidden directories and encoded data.
TIMEEOF

# Create investigation notes
cat > incident/investigation_notes.txt << 'INVEOF'
INVESTIGATION NOTES
===================

INITIAL FINDINGS:
- Multiple failed brute force attempts on root and admin accounts
- Successful compromise of 'backup' account
- Privilege escalation to root via sudo
- Second access using SSH key (persistence mechanism)

EVIDENCE LOCATIONS:
1. logs/auth.log - Authentication logs showing the attack
2. .bash_history - Commands executed by attacker
3. suspicious_files/ - Files left by attacker (check hidden files!)

ANALYSIS TASKS:
1. Review auth.log for attack timeline
2. Examine bash history for attacker actions
3. Search for hidden files and directories
4. Look for encoded or obfuscated data
5. Check file permissions and timestamps

The flag is hidden somewhere in the evidence. 
Use your forensics skills to find it!
INVEOF

# Set realistic timestamps (making some files appear recently modified)
touch -t 202412150825 incident/logs/auth.log
touch -t 202412150826 incident/.bash_history
touch -t 202412150915 incident/suspicious_files/.attacker_data/.hidden_flag.txt

cat > README.md << 'READMEEOF'
# Challenge 8: System Intrusion Analysis

===================================
INCIDENT RESPONSE SCENARIO
===================================

Your organization's server has been compromised!
Evidence has been collected in the 'incident/' directory.

Your mission: Perform a forensic analysis to:
  1. Understand how the attacker gained access
  2. Identify what actions they took
  3. Find the flag they tried to hide

START YOUR INVESTIGATION:
  cd incident
  cat investigation_notes.txt

KEY FILES TO EXAMINE:
  - logs/auth.log (authentication logs)
  - .bash_history (command history)
  - timeline.txt (timeline analysis)
  - suspicious_files/ (recovered files)

FORENSICS TIPS:
  - Look for patterns in logs
  - Check for hidden files (ls -la)
  - Examine encoded data (base64, hex)
  - Analyze timestamps and permissions
  - Connect the evidence pieces

This is the final challenge. Good luck, detective!
===================================
READMEEOF

cd ..
echo "✓ Challenge 8 complete"

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "Setup Complete! All 8 challenges are ready."
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "To see available challenges:"
echo "  ls"
echo ""
echo "To navigate into a challenge:"
echo "  cd challenge1-hidden-files"
echo "  cd challenge2-process-detective"
echo "  ... and so on"
echo ""
echo "Each challenge directory contains:"
echo "  - README.md with instructions"
echo "  - Challenge-specific files and artifacts"
echo ""
echo "Good luck with the challenges!"
echo "═══════════════════════════════════════════════════════════"
