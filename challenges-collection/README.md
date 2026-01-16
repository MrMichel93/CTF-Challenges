# CTF Challenges Collection (Combined Challenges 1-8)

This is a **combined setup** of all 8 CTF challenges in one convenient package.

## What is this?

Instead of setting up each challenge individually, this folder contains a single `setup.sh` script that sets up all 8 challenges at once in a unified environment.

## How to use

1. **Run the setup script:**
   ```bash
   cd challenges-collection
   bash setup.sh
   ```

2. **After setup completes, list the available challenges:**
   ```bash
   ls
   ```

3. **Navigate into any challenge you want to tackle:**
   ```bash
   cd challenge1-hidden-files
   cd challenge2-process-detective
   cd challenge3-network-navigator
   cd challenge4-log-forensics
   cd challenge5-permission-puzzle
   cd challenge6-archive-archaeology
   cd challenge7-script-debugger
   cd challenge8-intrusion-analysis
   ```

4. **Read the README.md in each challenge directory for specific instructions**

## Challenges Included

1. **Challenge 1: Hidden Files Explorer** - Learn about hidden files and directory navigation
2. **Challenge 2: Process Detective** - Master process management and investigation
3. **Challenge 3: Network Navigator** - Network configuration analysis and data retrieval
4. **Challenge 4: Log File Forensics** - Analyze log files to find suspicious activity
5. **Challenge 5: Permission Puzzle** - Understand and manipulate Linux file permissions
6. **Challenge 6: Archive Archaeology** - Extract nested archive files
7. **Challenge 7: Script Debugger** - Debug a broken Bash script
8. **Challenge 8: System Intrusion Analysis** - Perform incident response and forensics

## Benefits of the Collection

- **One-time setup**: All challenges are set up with a single command
- **Easy navigation**: Use `ls` and `cd` to move between challenges
- **Self-contained**: Each challenge has its own directory with all necessary files
- **Progressive difficulty**: Start with Challenge 1 and work your way up!

## Individual Challenges

If you prefer to set up challenges individually, you can still use the standalone challenge folders in the parent directory:
- `challenge1-hidden-files/`
- `challenge2-process-detective/`
- `challenge3-network-navigator/`
- ... and so on

Each of those folders has its own `setup.sh` script.

## Getting Started

Simply run:
```bash
bash setup.sh
```

The script will:
1. Display a welcome message explaining the collection
2. Set up all 8 challenges in their respective directories
3. Show you how to navigate between challenges

Happy hacking! 🚀
