# Linux Log Analyzer

A lightweight Bash project for turning Linux authentication logs into a simple security summary.

## Features

- Detect failed SSH login attempts
- Extract source IP addresses
- Identify invalid users
- Count repeated events
- Generate a readable report

## Workflow

```text
Authentication Log
        |
        v
grep / awk / sort
        |
        v
Extract & Filter
        |
        v
Count & Group
        |
        v
Security Summary
```

## Usage

```bash
chmod +x log-analyzer.sh
./log-analyzer.sh auth.log
```

## Example Output

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

## Tools

`Bash` · `grep` · `awk` · `sort` · `uniq` · `cut`

## Goal

Practice Linux text processing and basic security log analysis with standard command-line tools.