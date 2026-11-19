# Linux Log Analyzer

A lightweight Bash script that parses Linux authentication logs and produces a readable summary of selected SSH-related events.

## Features

- Count failed SSH login attempts
- Extract source IP addresses
- Identify invalid-user events
- Count repeated events
- Print a compact security summary

## How it works

```text
Authentication log
       |
       v
grep / awk / sort / uniq
       |
       v
Extract and filter events
       |
       v
Count and group results
       |
       v
Security summary
```

## Requirements

- Bash
- Standard command-line tools: `grep`, `awk`, `sort`, `uniq`, `cut`
- A readable authentication log file or a sample log

## Run

Clone the repository:

```bash
git clone https://github.com/ramznagc/linux-log-analyzer.git
cd linux-log-analyzer
```

Make the script executable and run it against the included sample:

```bash
chmod +x log-analyzer.sh
./log-analyzer.sh sample-auth.log
```

For a real system log, pass the path explicitly. Depending on the Linux distribution, authentication logs may be stored in files such as `/var/log/auth.log` or `/var/log/secure`. You may need elevated read permissions.

## Example output

The following is illustrative output:

```text
Linux Log Analysis
------------------
Failed SSH attempts : 5
Unique source IPs    : 3
Invalid users        : 2

Top source IPs:
192.168.1.10         3
10.0.0.15            1
172.16.0.8            1
```

## Limitations

This is a small learning tool based on text parsing. It is not a SIEM, does not replace centralized log collection, and should not be treated as a comprehensive intrusion detection system.

## Tools

Bash · grep · awk · sort · uniq · cut

## Author

Ramazan Agac · [GitHub](https://github.com/ramznagc)
