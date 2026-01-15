# CTF Challenges Repository

Welcome to the CLI Skills CTF Challenges! This repository contains a series of Capture The Flag (CTF) challenges designed to test and improve your command-line interface skills. The challenges range from beginner-friendly to advanced, covering various aspects of Linux/Unix system administration, security analysis, and problem-solving.

## Overview

This repository includes 8 progressively challenging CTF exercises that will help you develop practical CLI skills used by system administrators, security professionals, and DevOps engineers in real-world scenarios.

## Challenge Structure

Each challenge is contained in its own directory with:
- A setup/challenge environment
- A README.md with challenge description, hints, and a complete cheat sheet
- All necessary files and data for the challenge

## Challenges

### Easy Level
1. **[Challenge 1: Hidden Files Explorer](./challenge1-hidden-files/)** - Learn to find and navigate hidden files and directories
2. **[Challenge 2: Process Detective](./challenge2-process-detective/)** - Master process management and monitoring commands

### Medium Level
3. **[Challenge 3: Network Navigator](./challenge3-network-navigator/)** - Explore network analysis and troubleshooting
4. **[Challenge 4: Log File Forensics](./challenge4-log-forensics/)** - Analyze system logs to find critical information
5. **[Challenge 5: Permission Puzzle](./challenge5-permission-puzzle/)** - Understand and manipulate file permissions

### Hard Level
6. **[Challenge 6: Archive Archaeology](./challenge6-archive-archaeology/)** - Extract and analyze nested archives
7. **[Challenge 7: Script Debugger](./challenge7-script-debugger/)** - Debug and fix complex shell scripts

### Very Hard Level
8. **[Challenge 8: System Intrusion Analysis](./challenge8-intrusion-analysis/)** - Perform comprehensive forensic analysis of a compromised system

## Disk Images

Pre-packaged disk images for all challenges are available in the **[Disk Images](./Disk%20Images/)** directory. These compressed archives can be easily distributed, hosted on websites, or loaded into different platforms.

Each disk image is a `.tar.gz` file containing the complete challenge environment. Perfect for:
- Hosting on educational platforms
- Distributing to students or training participants
- Deploying on CTF hosting services
- Quick offline access

See the [Disk Images README](./Disk%20Images/README.md) for more details on how to use and deploy them.

## Getting Started

### Option 1: Clone the Repository

1. Clone this repository:
   ```bash
   git clone https://github.com/MrMichel93/CTF-Challenges.git
   cd CTF-Challenges
   ```

2. Navigate to any challenge directory:
   ```bash
   cd challenge1-hidden-files
   ```

3. Read the README.md in each challenge folder for instructions

4. Try to solve the challenge on your own before checking the hints or solutions

### Option 2: Use Disk Images

1. Download a challenge disk image from the `Disk Images` folder
   
2. Extract the challenge:
   ```bash
   tar -xzf challenge1-hidden-files.tar.gz
   cd challenge1-hidden-files
   ```

3. Read the README.md and run the setup script:
   ```bash
   cat README.md
   bash setup.sh
   ```

## Skills You'll Learn

- File system navigation and manipulation
- Process and system monitoring
- Network analysis and diagnostics
- Log file analysis and pattern matching
- Permission and security management
- Archive handling and data extraction
- Shell scripting and debugging
- System forensics and incident response

## Prerequisites

- Basic familiarity with Linux/Unix command line
- A Linux/Unix environment (Linux, macOS, WSL on Windows)
- Curiosity and willingness to learn!

## Tips for Success

- Read the challenge description carefully
- Use `man` pages to learn about commands (e.g., `man grep`)
- Google is your friend - searching for command examples is encouraged
- Try different approaches if you get stuck
- Learn from the cheat sheets even after solving challenges

## Contributing

Found a bug or have an idea for a new challenge? Feel free to open an issue or submit a pull request!

## License

This repository is intended for educational purposes. Feel free to use and modify for learning.

---

Happy hacking! 🎯🔐💻
