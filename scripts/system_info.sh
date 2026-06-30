#!/bin/bash

# Acknowledgment & Setup
LOG_FILE="../logs/system_log_$(date +%Y%m%d).log"


generate_report() {
    echo "=============================================="
    echo "Assalamualaikum! Saya Ahmad Yasin bin Haslizaidi"
    echo "=============================================="
    echo "Current Date and Time: $(date)"
    echo ""
    echo "Disk Usage (Storage):"
    df -h | grep '^/dev/'
    echo ""
    echo "Memory Usage (RAM):"
    free -h
    echo ""
    echo "Top 5 Processes: "
    ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
    echo "=============================================="
}


generate_report | tee -a "$LOG_FILE"
